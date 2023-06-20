class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  has_many :chat_rooms
  has_many :chats, through: :chat_room
  has_many :friend_requests
  has_many :chat_messages
  has_many :seats
  
  def get_profile_image(width,height)
    unless profile_image.attached? 
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def full_name
    last_name + " " + first_name
  end
  
  def full_name_kana
    last_name_kana + " " + first_name_kana
  end
end
