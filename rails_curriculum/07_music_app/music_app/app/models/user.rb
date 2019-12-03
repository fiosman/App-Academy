class User < ApplicationRecord 
  validates :password_digest, presence: true 
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true } 

  attr_reader :password
end