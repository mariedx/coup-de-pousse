class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :gardens
  has_many :appointments, through: :gardens
  has_many :guest, foreign_key: "guest_id", class_name: "Appointment"
  has_many :host, foreign_key: "host_id", class_name: "Appointment"
  has_one_attached :avatar
  has_many :favorites, :dependent => :destroy
  has_many :chat_rooms, dependent: :destroy
  has_many :sender, foreign_key: "sender_id", class_name: "ChatRoom"
  has_many :receiver, foreign_key: "receiver_id", class_name: "ChatRoom"

  has_many :messages, dependent: :destroy


    def to_param
      [id, first_name.parameterize].join("-")
     end

    def name
      email.split('@')[0]
    end

end
