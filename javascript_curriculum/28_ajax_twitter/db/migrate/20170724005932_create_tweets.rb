class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.text :content, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :tweets, :user_id
  end
end
