class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment, null: false 
      t.integer :author_id, null: false 
      t.references :commentable, polymorphic: true, null: false  
      t.timestamps 
    end
  end
end
