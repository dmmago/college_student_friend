class Public::ChatsController < ApplicationController
  
  def create
    current_customer_chats = ChatRoom.where(customer_id: current_customer.id).map(&:chat_id)
    chat = ChatRoom.where(chat_id: current_customer_chats, customer_id: params[:customer_id]).map.first
    
    if chat.blank?
      chat = Chat.create
      ChatRoom.create(chat_id: chat.id, customer_id: current_customer.id)
      ChatRoom.create(chat_id: chat.id, customer_id: params[:customer_id])
    end
    redirect_to chat_path(chat.id)
  end


  def show
    
  end

end
