# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true } 
  after_initialize :ensure_session_token 

  def is_password?(password) 
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def reset_session_token! 
    self.session_token = User.generate_session_token 
    self.save! 
    self.session_token 
  end

  private 

  def self.generate_session_token 
    SecureRandom::urlsafe_base64(16)
  end
end
