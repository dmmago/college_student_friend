class Seat < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :lecture
  validates :lecture_id, uniqueness: { scope: :customer_id }
end
