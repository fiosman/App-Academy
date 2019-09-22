class ChangeTagTopic < ActiveRecord::Migration[5.2]
  def change
    add_index :tag_topics, :topic, unique: true
  end
end
