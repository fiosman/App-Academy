class CreateCorgis < ActiveRecord::Migration[5.1]
  def change
    create_table :corgis do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
