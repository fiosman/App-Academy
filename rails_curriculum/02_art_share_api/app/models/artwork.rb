class Artwork < ApplicationRecord 
  validates :title, :artist_id, :image_url, presence: true 
  validates :title, uniqueness: { scope: :artist_id }
  validates :image_url, uniqueness: true
end