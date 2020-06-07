class Invitation < ApplicationRecord
  # N.B. Remember, Rails 5 automatically validates the presence of
  # belongs_to associations, so we can leave the presence validation of
  # party and guest out here.
  belongs_to :party
  belongs_to :guest
end
