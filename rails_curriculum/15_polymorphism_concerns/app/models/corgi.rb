class Corgi < ApplicationRecord
  has_many :toys, as: :toyable 
end
