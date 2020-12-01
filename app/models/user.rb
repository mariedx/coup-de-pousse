class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gardens
  has_many :appointments, through: :gardens
  has_many :guest_list, foreign_key: "guest_id", class_name: "Appointment"
  has_many :host_list, foreign_key: "host_id", class_name: "Appointment"

end
