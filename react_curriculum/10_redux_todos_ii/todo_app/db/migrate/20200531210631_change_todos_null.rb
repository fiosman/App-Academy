class ChangeTodosNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :todos, :done, :true
  end
end
