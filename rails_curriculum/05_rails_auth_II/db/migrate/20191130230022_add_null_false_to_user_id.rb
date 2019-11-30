class AddNullFalseToUserId < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cat_rental_requests, :user_id, null: false
  end
end
