class CreateArrangements < ActiveRecord::Migration[6.1]
  def change
    create_table :arrangements do |t|
      t.string :layout, null: false

      t.timestamps
    end
  end
end
