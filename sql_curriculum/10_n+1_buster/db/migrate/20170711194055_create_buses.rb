class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.string :model, null: false
      t.integer :route_id

      t.timestamps
    end
    add_index :buses, :route_id
  end
end
