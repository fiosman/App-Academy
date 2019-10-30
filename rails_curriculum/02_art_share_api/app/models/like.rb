class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true 
end