# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  premium    :boolean          default(FALSE)
#

class User < ApplicationRecord 
  validates :email, uniqueness: true, presence: true

  has_many :submitted_urls, 
    primary_key: :id, 
    foreign_key: :submit_user_id,
    class_name: :ShortURL
  
  has_many :visits, 
    primary_key: :id, 
    foreign_key: :visitor_id, 
    class_name: :Visit

  has_many :visited_urls,
    -> { distinct }, 
    through: :visits, 
    source: :short_url
end
