class CreateCastings < ActiveRecord::Migration[5.1]
  def change
    create_table :castings do |t|
      t.integer :actor_id, null: false
      t.integer :movie_id, null: false
      t.integer :ord, null: false
    end
    add_index :castings, :actor_id
    add_index :castings, :movie_id
    add_index :castings, %i(actor_id movie_id), unique: true
  end
end
