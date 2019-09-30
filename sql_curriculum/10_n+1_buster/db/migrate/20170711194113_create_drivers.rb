class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :name, null: false
      t.integer :bus_id

      t.timestamps
    end
    add_index :drivers, :bus_id
  end
end
