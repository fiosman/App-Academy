class User < ApplicationRecord 
  validates :username, :session_token, presence: true, uniqueness: true 
  validates :password_digest, presence: true 
  validates :password, length: { minimum: 6, allow_nil: true } 

  after_initialize :ensure_session_token 

  attr_reader :password  
  
  def self.find_by_credentials(username, password) 
  end   
  
  def self.generate_session_token 
    SecureRandom::urlsafe_base64
  end 

  def self.reset_session_token! 
    self.session_token = User.generate_session_token 
    self.save! 
    self.session_token 
  end 

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end 

  def is_password?(password) 
    self.password_digest.is_password?(password)
  end 

  private 

  def ensure_session_token 
    self.session_token ||= User.generate_session_token 
  end 



end