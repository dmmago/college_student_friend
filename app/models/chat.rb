class Chat < ApplicationRecord
  has_many :chat_rooms
  has_many :customers, through: :chat_rooms
end
