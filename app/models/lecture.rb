class Lecture < ApplicationRecord
  has_many :seats
  
  def seating_capacity
    row*col
  end
end
