class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.integer :gardener_id
      t.string :species, null: false

      t.timestamps
    end
    add_index :plants, :gardener_id
  end
end
