class Cat < ApplicationRecord
  has_many :toys, as: :toyable 
end
