class RemoveCatIdFromCats < ActiveRecord::Migration[5.2]
  def change
    remove_column :cats, :cat_id, :integer
  end
end
