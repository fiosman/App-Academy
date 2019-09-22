class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :url_id, null: false
      t.integer :tag_topic_id, null: false

      t.timestamps
    end

    add_index :taggings, :url_id
    add_index :taggings, :tag_topic_id
  end
end
