class ChangeDefaultValueToVisibleAndCompleted < ActiveRecord::Migration[5.2]
  def change
    change_column_default :goals, :visible, false 
    change_column_default :goals, :completed, false 
  end
end
