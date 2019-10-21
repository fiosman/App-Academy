# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ApplicationRecord 
  validates :username, presence: true, uniqueness: true

  has_many :artworks, 
  foreign_key: :artist_id
end
