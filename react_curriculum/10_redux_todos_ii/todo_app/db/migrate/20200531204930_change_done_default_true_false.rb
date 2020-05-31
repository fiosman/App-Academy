class ChangeDoneDefaultTrueFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_default :steps, :done, from: true, to: false
  end
end
