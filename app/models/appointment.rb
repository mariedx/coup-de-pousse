class Appointment < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :host, class_name: "User"
  belongs_to :garden

  validates_presence_of :start_date, :end_date
  validate :start_must_be_before_end_date
  validate :start_in_future

  after_create :new_app_guest, :new_app_host


  # emails methods

  def new_app_guest
    AppointmentMailer.new_app_guest(self).deliver_now
  end

  def new_app_host
    AppointmentMailer.new_app_host(self).deliver_now
  end

  def show_start_date
    self.start_date.strftime('%d/%m/%Y à %H:%M')
  end

  def show_end_date
    self.end_date.strftime('%d/%m/%Y à %H:%M')
  end

  private

  def start_must_be_before_end_date
      errors.add(:start_date, "doit être avant la date de fin") unless
        self.start_date < self.end_date
  end

  def start_in_future
    errors.add(:start_date, ": Impossible de réserver un rendez-vous dans le passé") unless start_date > DateTime.now
  end


end
