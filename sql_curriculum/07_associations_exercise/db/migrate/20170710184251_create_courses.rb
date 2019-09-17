class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :prereq_id
      t.integer :instructor_id
      
      t.timestamps
    end
  end
end
