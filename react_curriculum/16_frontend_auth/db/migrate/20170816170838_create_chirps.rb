class CreateChirps < ActiveRecord::Migration[5.1]
  def change
    create_table :chirps do |t|
      t.text :body, null: false
      t.integer :author_id, null: false
      
      t.timestamps
    end
  end
end
