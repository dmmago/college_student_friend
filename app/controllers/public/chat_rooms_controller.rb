class Public::ChatRoomsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    friendrequest_customer_ids = FriendRequest.where(to_customer_id: current_customer.id, status: "approve").pluck(:from_customer_id)
    
    @friend_customers=FriendRequest.where(to_customer_id: friendrequest_customer_ids, from_customer_id: current_customer.id, status: "approve").map do |approve|
    approve.to_customer
    end
    @customer=Customer.find(current_customer.id)
  end
  
  
end
