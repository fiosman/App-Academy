class AddParentCommentIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :parent_comment_id, :integer 
    add_index :comments, :parent_comment_id 
  end
end
