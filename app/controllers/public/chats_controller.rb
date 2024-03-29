class Public::ChatsController < ApplicationController
  before_action :authenticate_customer!
  def create
    current_customer_chats = ChatRoom.where(customer_id: current_customer.id).map(&:chat_id)
    #ChatRoomから自分の情報をとる
    chat = ChatRoom.where(chat_id: current_customer_chats, customer_id: params[:customer_id]).map(&:chat_id).first
    #上記ユーザーとログインユーザーのチャットを取得
    if chat.blank?
      chat = Chat.create
      ChatRoom.create(chat_id: chat.id, customer_id: current_customer.id)
      ChatRoom.create(chat_id: chat.id, customer_id: params[:customer_id])
    end
    redirect_to chat_path(chat)
  end


  def show

    @chat = Chat.find(params[:id])
    @chat_room = @chat.chat_rooms.where.not(customer_id: current_customer.id).first.customer
      #相手の情報取得
      if @chat.chat_rooms.where.not(customer_id: @chat_room.id).first.customer == current_customer
      #チャットルームをチャットIDと相手のIDでないほうを検索しログインユーザーでないならトップ画面へ
        @chat_messages = ChatMessage.where(chat_id: @chat)
      else
        redirect_to root_path
      end


  end

end
