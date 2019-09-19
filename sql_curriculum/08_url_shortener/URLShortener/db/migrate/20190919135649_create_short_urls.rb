class CreateShortUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :short_urls do |t|
      t.string :short_url, null: false
      t.string :long_url, null: false
      t.integer :submit_user_id, null: false

      t.timestamps
    end
    add_index :short_urls, :submit_user_id
    add_index :short_urls, :short_url, unique: true
  end
end
