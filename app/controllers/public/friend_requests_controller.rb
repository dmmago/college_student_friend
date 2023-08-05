class Public::FriendRequestsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @friend_requests = FriendRequest.where(to_customer_id: current_customer.id, status: 'approve')
    #ログインユーザへの友達申請のid取得
  end
  
    

  def create
    friendrequest = current_customer.active_friend_request.find_by(to_customer_id: params[:customer_id])
    #ログインユーザーのフレンドリクエストから送信した会員を取り出す
    if !friendrequest
      #ないなら
        FriendRequest.create(to_customer_id: params[:customer_id], from_customer_id: current_customer.id, status: :approve)
    else
      if friendrequest.approve?#すでに許可なら不可に
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
