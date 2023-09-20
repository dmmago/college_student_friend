class Public::FriendRequestsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @friend_requests = FriendRequest.where(to_customer_id: current_customer.id, status: 0)
    #ログインユーザへの友達申請のid取得

  end

  def create
    friendrequest = current_customer.active_friend_request.find_by(to_customer_id: params[:customer_id])
    if !friendrequest
        FriendRequest.create(to_customer_id: params[:customer_id], from_customer_id: current_customer.id, status: 0)
    else
      if friendrequest.approve?
         friendrequest.update(to_customer_id: params[:customer_id], from_customer_id: current_customer.id, status: 1)
         flash[:notice] = "フレンドリクエストを取り下げました"
      else
         friendrequest.update(to_customer_id: params[:customer_id], from_customer_id: current_customer.id, status: 0)
         flash[:notice] = "フレンドリクエストを送信しました"
      end
    end
    redirect_back(fallback_location: root_url)
  end
end
