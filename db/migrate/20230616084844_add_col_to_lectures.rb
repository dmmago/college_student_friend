class AddColToLectures < ActiveRecord::Migration[6.1]
  def change
    add_column :lectures, :col, :integer, null: false, default: 1
  end
end
