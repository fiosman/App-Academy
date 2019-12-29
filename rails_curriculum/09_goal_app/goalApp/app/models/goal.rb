class Goal < ApplicationRecord 
  validates :title, :details, :user_id, :completed, :visible, presence: true

  belongs_to :user
end