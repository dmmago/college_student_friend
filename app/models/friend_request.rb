class FriendRequest < ApplicationRecord
  belongs_to :to_customer, class_name: "Customer"
  belongs_to :from_customer, class_name: "Customer"
  enum status: { approve: 0, unaccept: 1 }
end
#approve 承認　unaccept 無効


  