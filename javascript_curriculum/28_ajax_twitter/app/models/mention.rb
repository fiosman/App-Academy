class Mention < ApplicationRecord
  validates :user, uniqueness: { scope: :tweet }

  belongs_to :tweet
  belongs_to :user
end
