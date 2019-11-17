class User < ApplicationRecord
  validates :username, :session_token, presence: true 
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
end
