class Public::FriendRequestsController < ApplicationController
  
  def create
    friendrequest = current_customer.active_friend_request.find_by(to_customer_id: params[:customer_id])
    if !friendrequest
        FriendRequest.create(to_customer_id: params[:customer_id], from_customer_id: current_customer.id, status: :approve)
    else
      if friendrequest.approve?
         friendrequest.unaccept!
      else
         friendrequest.approve!
      end
    end
    if params[:reaction] == "approve"
      flash[:notice] = "フレンドリクエストを送信しました"
    else
      flash[:notice] = "フレンドリクエストを取り下げました"
    end
    redirect_back(fallback_location: root_url)
  end
end
