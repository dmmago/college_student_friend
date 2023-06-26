class Lecture < ApplicationRecord
  has_many :seats, dependent: :destroy
  validates :lecture_name, presence: true

  def seating_capacity
    row*col
  end
end
