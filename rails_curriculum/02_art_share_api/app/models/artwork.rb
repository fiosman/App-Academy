class Artwork < ApplicationRecord 
  validates :title, :artist_id, presence: true 
  validates :image_url, presence: true
end