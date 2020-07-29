# == Schema Information
#
# Table name: benches
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  lat         :float            not null
#  lng         :float            not null
#  seating     :integer          default(2), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Bench < ApplicationRecord 
  validates :description, :lat, :lng, presence: true

  has_many :reviews

  has_one_attached :photo

  def self.in_bounds(bounds) 
    #get the values lat and long coordinates from both hashes
    fst_hsh_cds = bounds[bounds.keys.first].values
    snd_hsh_cds = bounds[bounds.keys.last].values

    #sort the lat aand long pairs
    lat_pairs = fst_hsh_cds.first.to_f < snd_hsh_cds.first.to_f ? 
      [fst_hsh_cds.first.to_f, snd_hsh_cds.first.to_f] : [snd_hsh_cds.first.to_f, fst_hsh_cds.first.to_f]
    lng_pairs = fst_hsh_cds.last.to_f < snd_hsh_cds.last.to_f ? 
      [fst_hsh_cds.last.to_f, snd_hsh_cds.last.to_f] : [snd_hsh_cds.last.to_f, fst_hsh_cds.last.to_f]
    
    #query for benches between latitude and longitude pairs
    Bench.where(lat: lat_pairs.first..lat_pairs.last, lng: lng_pairs.first..lng_pairs.last)
  end

  def self.seating_range(min, max)
    Bench.where(seating: min..max)
  end

  def average_rating
    self.reviews.average(:rating).to_f.round
  end
end
