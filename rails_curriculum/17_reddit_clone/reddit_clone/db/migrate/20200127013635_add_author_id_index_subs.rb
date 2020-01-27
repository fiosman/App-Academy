class AddAuthorIdIndexSubs < ActiveRecord::Migration[5.2]
  def change
    add_index :subs, :author_id
  end
end
