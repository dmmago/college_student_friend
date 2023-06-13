class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ChatMessage.create!(
      content: data['chat_message'],
      customer_id: current_customer.id,
      chat_id: data['chat_id']
    )
      
  end
end
