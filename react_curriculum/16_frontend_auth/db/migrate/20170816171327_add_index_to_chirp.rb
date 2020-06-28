class AddIndexToChirp < ActiveRecord::Migration[5.1]
  def change
    add_index :chirps, :author_id
  end
end
