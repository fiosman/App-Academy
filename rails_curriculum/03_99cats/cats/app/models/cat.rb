class Cat < ApplicationRecord 
  COLORS = %w(red green blue purple black white)
  validates :birth_date, :name, presence: true 
  validates :color, presence: true, inclusion: { in: COLORS }
  validates :sex, presence: true, inclusion: { in: %w(M F) }
end