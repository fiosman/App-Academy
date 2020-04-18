class Follow < ApplicationRecord
  validates :follower, uniqueness: { scope: :followee }

  belongs_to :followee,
    class_name: :User

  belongs_to :follower,
    class_name: :User
end
