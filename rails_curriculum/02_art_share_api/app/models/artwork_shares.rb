class ArtworkShare < ApplicationRecord 
  validates :artwork_id, :viewer_id, presence: true 
  validates :viewer_id, uniqueness: { scope: :artwork_id }
end