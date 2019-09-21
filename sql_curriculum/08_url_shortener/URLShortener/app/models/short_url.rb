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

  belongs_to :submitter,
    primary_key: :id, 
    foreign_key: :submit_user_id, 
    class_name: :User

  has_many :visits, 
    primary_key: :short_url,
    foreign_key: :shortened_url, 
    class_name: :Visit

  has_many :visitors, 
    through: :visits, 
    source: :user

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
    visits.count 
  end

  def num_uniques 
    visitors.count
  end



end
