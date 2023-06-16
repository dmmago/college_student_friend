class RemoveSeatingCapacityFromLectures < ActiveRecord::Migration[6.1]
  def change
    remove_column :lectures, :seating_capacity, :integer
  end
end
