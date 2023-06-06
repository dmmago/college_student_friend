class Public::FriendRequestsController < ApplicationController
  
  def create
    friendrequest = FriendRequest.find_or_initialize_by(to_customer_id: params[:customer_id], from_customer_id: current_customer.id)
    friendrequest.update(status: params[:reaction])
  end
end
