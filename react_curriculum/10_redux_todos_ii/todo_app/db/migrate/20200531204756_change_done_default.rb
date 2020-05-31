class ChangeDoneDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :steps, :done, true 
  end
end
