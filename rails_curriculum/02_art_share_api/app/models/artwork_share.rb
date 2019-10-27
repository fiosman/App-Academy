# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         default("2019-10-27 00:50:05.414945"), not null
#  updated_at :datetime         default("2019-10-27 00:50:05.414945"), not null
#

class ArtworkShare < ApplicationRecord 
  validates :artwork_id, :viewer_id, presence: true 
  validates :artwork_id, uniqueness: { scope: :viewer_id }

  belongs_to :viewer,
    class_name: :User

  belongs_to :artwork
end
