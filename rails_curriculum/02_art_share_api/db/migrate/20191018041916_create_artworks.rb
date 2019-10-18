class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false 
      t.string :image_url, null: false 
      t.integer :artist_id, null: false 

      t.timestamps
    end
  end
end
