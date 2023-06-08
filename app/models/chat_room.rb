class ChatRoom < ApplicationRecord
  belongs_to :customer
  belongs_to :chat_room, optional: true
end
