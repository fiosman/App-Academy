class AddTimeStampsToArtworkShares < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :artwork_shares, default: Time.zone.now 
  end
end
