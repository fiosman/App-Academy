class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false

      t.timstamps
    end
  end

  add_index :users, :username, unique: true
end
