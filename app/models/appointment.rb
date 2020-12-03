class Appointment < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :host, class_name: "User"
  belongs_to :garden

  after_create :new_app_guest, :new_app_host

  def new_app_guest
    GuestMailer.app_send_email(self).deliver_now
  end

  def new_app_host
    HostMailer.app_received_email(self).deliver_now
  end


end
