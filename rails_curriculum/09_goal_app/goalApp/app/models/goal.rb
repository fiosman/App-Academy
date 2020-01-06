class Goal < ApplicationRecord 
  include Commentable 
  
  validates :title, :details, presence: true

  belongs_to :user 
end