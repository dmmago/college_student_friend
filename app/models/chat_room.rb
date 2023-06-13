class ChatRoom < ApplicationRecord
  belongs_to :customer
  belongs_to :chat
end
