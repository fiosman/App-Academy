class AddSeatingToBenches < ActiveRecord::Migration[5.2]
  def change
    add_column :benches, :seating, :integer, default: 2, null: false
  end
end
