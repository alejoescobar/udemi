class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :owner_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
