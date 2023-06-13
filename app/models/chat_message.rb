class ChatMessage < ApplicationRecord
  belongs_to :customer
  belongs_to :chat

  after_create_commit { ChatMessageBroadcastJob.perform_later self }
end
