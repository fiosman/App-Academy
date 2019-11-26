class AddCatIdToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :cat_id, :integer, null: false 
    add_index :cats, :cat_id, unique: true
  end
end
