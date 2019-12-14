class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true
  validates :live, inclusion: { in: [true, false] }
  
  belongs_to :band 

  has_many :tracks, dependent: :destroy
end
