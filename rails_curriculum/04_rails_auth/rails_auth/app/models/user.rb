class User < ApplicationRecord
  validates :username, :session_token, presence: true 
end
