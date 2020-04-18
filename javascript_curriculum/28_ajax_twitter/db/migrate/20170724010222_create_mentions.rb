class CreateMentions < ActiveRecord::Migration[5.1]
  def change
    create_table :mentions do |t|
      t.integer :tweet_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :mentions, :tweet_id
    add_index :mentions, :user_id
    add_index :mentions, [:tweet_id, :user_id], unique: true
  end
end
