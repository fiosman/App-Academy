class Album < ApplicationRecord
  validates :title, :year, :band_id, :live, presence: true

  belongs_to :band  
end
