# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord 
  validates :title, :artist_id, :image_url, presence: true 
  validates :title, uniqueness: { scope: :artist_id }
  validates :image_url, uniqueness: true 

  belongs_to :artist, 
    primary_key: :id, 
    foreign_key: :artist_id, 
    class_name: :User
end
