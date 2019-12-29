class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false 
      t.string :details, null: false 
      t.boolean :visible, null: false, default: true 
      t.integer :user_id, null: false
      t.boolean :completed, null: false, default: true
      t.integer :cheers, default: 0

      t.timestamps 
    end

    add_index :goals, :user_id 
    add_index :goals, :title
  end
end
