class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.integer :seating_capacity, null: false
      t.integer :row, null: false
      t.timestamps
    end
  end
end
