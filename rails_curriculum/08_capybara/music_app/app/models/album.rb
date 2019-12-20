# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  live       :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true
  validates :live, inclusion: { in: [true, false] }
  
  belongs_to :band 

  has_many :tracks, dependent: :destroy
end
