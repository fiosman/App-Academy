class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_choice_id, null: false

      t.timestamps
    end
    
    add_index :responses, :user_id 
    add_index :responses, :answer_choice_id
  end
end
