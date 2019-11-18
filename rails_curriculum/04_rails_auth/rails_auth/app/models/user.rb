class User < ApplicationRecord

  attr_reader :password 
  
  validates :username, :session_token, presence: true 
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: { message: 'Password can\'t be blank' }

  def self.find_by_credentials 
  end

  def self.generate_session_token 
  end

  def reset_session_token! 
  end

  def ensure_session_end 
  end

  def password= 
  end
end
