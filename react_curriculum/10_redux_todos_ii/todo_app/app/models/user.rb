# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_session_token  (session_token) UNIQUE
#  index_users_on_username       (username) UNIQUE
#

class User < ApplicationRecord 
  validates :username, :session_token, presence: true, uniqueness: true 
  validates :password_digest, presence: true 
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password 

  after_initialize :ensure_session_token

  has_many :todos
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user && user.is_password?(password)
      user
    else 
      nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end 

  def reset_session_token! 
    self.session_token = User.generate_session_token 
    self.save! 
    self.session_token 
  end

  def password=(password)
    @password = password 
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end 

  private 

  def ensure_session_token 
    self.session_token ||= User.generate_session_token
  end 

end
