class Artwork < ApplicationRecord 
  validates :title, :artist_id, presence: true, uniqueness: true
  validates :image_url, presence: true
end