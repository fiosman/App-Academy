# == Schema Information
#
# Table name: benches
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  lat         :float            not null
#  lng         :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Bench < ApplicationRecord 
  validates :description, :lat, :lng, presence: true

  def self.in_bounds(bounds) 
    #get the values lat and long coordinates from both hashes
    fst_hsh_cds = bounds[bounds.keys.first].values
    snd_hsh_cds = bounds[bounds.keys.last].values

    #sort the lat aand long pairs
    lat_pairs = fst_hsh_cds.first < snd_hsh_cds.first ? 
      [fst_hsh_cds.first, snd_hsh_cds.first] : [fst_hsh_cds.first, snd_hsh_cds.first]
    long_pairs = fst_hsh_cds.last < snd_hsh_cds.last ? 
      [fst_hsh_cds.last, snd_hsh_cds.last] : [fst_hsh_cds.last, snd_hsh_cds.last]
  end
end
