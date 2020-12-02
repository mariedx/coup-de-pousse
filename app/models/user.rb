class User < ApplicationRecord
  # Include default devise modules. Others available are:
<<<<<<< HEAD
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
=======
  #lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
>>>>>>> develop
  has_many :gardens
  has_many :appointments, through: :gardens
  has_many :guest, foreign_key: "guest_id", class_name: "Appointment"
  has_many :host, foreign_key: "host_id", class_name: "Appointment"

end
