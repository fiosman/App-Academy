class Gift < ApplicationRecord
  # N.B. Remember, Rails 5 automatically validates the presence of
  # belongs_to associations, so we can leave the presence validation of
  # guest out here.
  validates :description, :title, presence: true

  belongs_to :guest
end
