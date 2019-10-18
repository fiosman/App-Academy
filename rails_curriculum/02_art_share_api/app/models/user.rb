class User < ApplicationRecord 
  validates :name, :email, presence: true
end