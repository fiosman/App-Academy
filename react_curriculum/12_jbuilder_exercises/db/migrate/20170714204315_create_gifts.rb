class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :guest_id, null: false

      t.timestamps
    end
    add_index :gifts, :guest_id
  end
end
