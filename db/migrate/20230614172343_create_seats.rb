class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.references :customer, foreign_key: true
      t.references :lecture, null: false, foreign_key: true

      t.timestamps
      t.index [:customer_id, :lecture_id], unique: true
    end
  end
end
