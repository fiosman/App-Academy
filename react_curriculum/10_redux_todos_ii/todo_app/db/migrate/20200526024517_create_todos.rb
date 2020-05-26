class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :body, null: false 
      t.string :title, null: false 
      t.boolean :done, null: false 
      
      t.timestamps 
    end
  end
end
