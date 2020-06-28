# == Schema Information
#
# Table name: chirps
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chirp < ApplicationRecord
  validates :body, presence: true
  validate :chirp_too_long

  has_many :likes,
    primary_key: :id,
    foreign_key: :chirp_id,
    class_name: :Like

  has_many :likers,
    through: :likes,
    source: :user

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  def chirp_too_long
    if body.length > 140
      errors[:body] << "too long"
    end
  end
end
