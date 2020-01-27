class RemoveSubsIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :subs, :author_id
  end
end
