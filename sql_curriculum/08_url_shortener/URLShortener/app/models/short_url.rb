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

  def self.random_code 
    new_url = SecureRandom::urlsafe_base64

    until !ShortURL.exists?(short_url: new_url) 
      new_url = SecureRandom::urlsafe_base64
    end

    return new_url
  end


end
