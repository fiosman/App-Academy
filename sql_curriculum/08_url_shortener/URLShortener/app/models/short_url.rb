# == Schema Information
#
# Table name: short_urls
#
#  id             :bigint           not null, primary key
#  short_url      :string           not null
#  long_url       :string           not null
#  submit_user_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ShortURL < ApplicationRecord 
  validates :submit_user_id, :long_url, :short_url, presence: true
  validates :short_url, uniqueness: true
  validate :no_spamming, :nonpremium_max

  belongs_to :submitter,
    primary_key: :id, 
    foreign_key: :submit_user_id, 
    class_name: :User

  has_many :visits, 
    primary_key: :short_url,
    foreign_key: :shortened_url, 
    class_name: :Visit

  has_many :taggings, 
    primary_key: :id, 
    foreign_key: :url_id, 
    class_name: :Tagging

  has_many :visitors, 
    -> { distinct },
    through: :visits, 
    source: :user

  has_many :tag_topics, 
    through: :taggings, 
    source: :tag_topic

  def self.random_code 
    new_url = SecureRandom.urlsafe_base64

    until !ShortURL.exists? short_url: new_url 
      new_url = SecureRandom.urlsafe_base64
    end

    return new_url
  end

  def self.generate_short_url(user, long_url)
    ShortURL.create! submit_user_id: user.id, long_url: long_url, short_url: ShortURL.random_code
  end

  def num_clicks 
    self.visits.count 
  end

  def num_uniques 
    self.visitors.count
  end

  def num_recent_uniques 
    self.visits.select(:id).distinct.where("visits.updated_at > ?", 10.minutes.ago).count
  end

  def no_spamming
    #throw error if user submit more than 5 requests per minute 
    submissions = ShortURL.
      select('*'). 
      where(submit_user_id: submit_user_id). 
      where('short_urls.created_at >= ?', 1.minute.ago)
    
    errors[:maximum] << 'of 5 submissions per minute!' if submissions.count >= 5
  end

  def nonpremium_max
    #non-premium users cannot create more than 5 total URLs
    return if self.submitter.premium

    errors[:only] << '5 total submissions per user are allowed' if submitter.submitted_urls.count >= 5
  end


end
