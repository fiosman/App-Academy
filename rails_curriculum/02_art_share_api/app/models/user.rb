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

  has_many :artworks, dependent: :destroy,
    foreign_key: :artist_id

  has_many :artwork_shares, dependent: :destroy,
    foreign_key: :viewer_id

  has_many :shared_artworks, 
    through: :artwork_shares, 
    source: :artwork

  has_many :comments, dependent: :destroy 

  has_many :likes, 
    primary_key: :id, 
    foreign_key: :user_id, 
    class_name: :Like

  has_many :liked_comments, 
    through: :likes, 
    source: :likeable,
    source_type: 'Comment'
  
  has_many :liked_artworks, 
    through: :likes, 
    source: :likeable, 
    source_type: 'Artwork'
end
