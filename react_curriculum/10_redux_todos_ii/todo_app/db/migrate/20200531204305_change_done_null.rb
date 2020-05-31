class ChangeDoneNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :steps, :done, :true
  end
end
