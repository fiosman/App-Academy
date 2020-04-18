class Tweet < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  has_many :mentions

  has_many :mentioned_users,
    through: :mentions,
    source: :user
end
