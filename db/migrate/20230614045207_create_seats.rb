class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.references :customer
      t.boolean :states, null: false, default: true 
      # customerが登録されたら無効になり登録できなくなるよう実装？

      t.timestamps
    end
  end
end
