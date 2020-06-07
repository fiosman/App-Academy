class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :favorite_color, null: false

      t.timestamps
    end
  end
end
