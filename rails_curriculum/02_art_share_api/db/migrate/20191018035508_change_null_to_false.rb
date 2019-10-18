class ChangeNullToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :username, :string, null: false
  end
end
