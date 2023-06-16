class AddColToLectures < ActiveRecord::Migration[6.1]
  def change
    add_column :lectures, :col, :integer, null: false
  end
end
