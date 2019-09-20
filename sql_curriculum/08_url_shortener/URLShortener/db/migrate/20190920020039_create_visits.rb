class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.string :shortened_url, null: false
      t.integer :visitor_id, null: false 

      t.timestamps
    end

    add_index :visits, :shortened_url
    add_index :visits, :visitor_id
  end
end
