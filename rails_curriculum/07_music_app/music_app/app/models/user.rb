class User < ApplicationRecord 
  validates :password_digest, presence: true 
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true } 

  attr_reader :password

  after_initialize :ensure_session_token

  def self.generate_session_token 
    SecureRandom::urlsafe_base64(16)
  end 

  def self.find_by_credentials(email, password) 
  end

  def reset_session_token! 
  end 

  def password=(password)
  end 

  def is_password?(password)
  end

  private 

  def ensure_session_token 
  end 

end