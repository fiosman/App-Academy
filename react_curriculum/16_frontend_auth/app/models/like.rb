# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  chirp_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  # This is actually redundant since Rails 5+ will automatically validate
  # belongs to relationships, and the foreign keys will be implicitly
  # checked as a result
  validates :user_id, :chirp_id, presence: true

  belongs_to :chirp,
    primary_key: :id,
    foreign_key: :chirp_id,
    class_name: :Chirp
    # optional: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
    # optional: true
end
