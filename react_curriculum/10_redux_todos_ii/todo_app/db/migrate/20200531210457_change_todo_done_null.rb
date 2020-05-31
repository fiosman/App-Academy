class ChangeTodoDoneNull < ActiveRecord::Migration[5.2]
  def change
    change_column_default :todos, :done, false
  end
end
