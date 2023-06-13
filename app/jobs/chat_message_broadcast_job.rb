class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    ActionCable.server.broadcast 'chat_channel', {chat_message: render_chat_message(chat_message)}
    # Do something later
  end

  private

  def render_chat_message(chat_message)
    ApplicationController.renderer.render(partial: 'public/chat_messages/chat_message', locals: { chat_message: chat_message, current_customer: chat_message.customer })
  end
end
