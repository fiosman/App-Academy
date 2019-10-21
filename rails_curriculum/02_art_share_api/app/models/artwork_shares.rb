class ArtworkShare < ApplicationRecord 
  validates :artwork_id, :viewer_id, presence: true 
end