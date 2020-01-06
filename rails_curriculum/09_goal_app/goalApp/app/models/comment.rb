class Comment < ApplicationRecord 
  validates :comment, presence: true 
  
  belongs_to :commentable, polymorphic: true
end 