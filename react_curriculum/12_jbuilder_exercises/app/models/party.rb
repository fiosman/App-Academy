class Party < ApplicationRecord
  validates :name, :location, presence: true

  has_many :invitations
  
  has_many :guests,
    through: :invitations,
    source: :guest
end
