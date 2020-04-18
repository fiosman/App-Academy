class User < ApplicationRecord
  attr_reader :password
  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :in_follows,
    foreign_key: :followee_id,
    class_name: :Follow

  has_many :out_follows,
    foreign_key: :follower_id,
    class_name: :Follow

  has_many :followers,
    through: :in_follows,
    source: :follower

  has_many :followees,
    through: :out_follows,
    source: :followee

  has_many :tweets, dependent: :destroy

  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    # no user with given username
    return nil if user.nil?

    # check user's password
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end

  def feed_tweets(limit = nil, max_created_at = nil)
    @tweets = Tweet
      .joins(:user)
      .joins('LEFT OUTER JOIN follows ON users.id = follows.followee_id')
      .where('tweets.user_id = :id OR follows.follower_id = :id', id: self.id)
      .order('tweets.created_at DESC')
      .distinct

    # TODO: How can we use limit/max_created_at here??

    @tweets
  end

  def followed_user_ids
    @followed_user_ids ||= out_follows.pluck(:followee_id)
  end

  def follows?(user)
    followed_user_ids.include?(user.id)
  end
end
