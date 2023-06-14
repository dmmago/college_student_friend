class Seat < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :lecture
end
