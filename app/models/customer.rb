class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :chat_rooms
  has_many :chats, through: :chat_room
  has_many :chat_messages
  has_many :seats
  has_many :active_friend_request, class_name: "FriendRequest", foreign_key: "from_customer_id", dependent: :destroy
  has_many :passive_friend_request, class_name: "FriendRequest", foreign_key: "to_customer_id", dependent: :destroy
  has_many :requesting_customer, through: :active_friend_request, source: :from_customer
  has_many :requested_customer, through: :passive_friend_request, source: :to_customer

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :school_year, presence: true
  validates :faculty, presence: true
  validates :introduction, presence: true

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

  def requesting_customer?(customer)
    if !self.active_friend_request || !self.active_friend_request.find_by(to_customer_id: customer.id)
      return false
    end
    self.active_friend_request.find_by(to_customer_id: customer.id).approve?

  end



end
