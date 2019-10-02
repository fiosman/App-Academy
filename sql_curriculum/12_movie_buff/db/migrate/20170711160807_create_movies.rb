class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :yr, null: false
      t.float :score, null: false
      t.integer :votes, null: false
      t.integer :director_id, null: false
    end

    add_index :movies, :director_id
    add_index :movies, :title
  end
end
