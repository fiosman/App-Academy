class ChangeDonePresence < ActiveRecord::Migration[5.2]
  def change
    change_column :steps, :done, :boolean
  end
end
