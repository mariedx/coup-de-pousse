class Appointment < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :host, class_name: "User"
  belongs_to :garden

  validates_presence_of :start_date, :end_date
  validate :start_must_be_before_end_date
  validate :start_must_be_futur

  private
  
  def start_must_be_before_end_date
      errors.add(:start_date, "doit être avant la date de fin") unless
        self.start_date < self.end_date
  end

  def start_in_future
    errors.add(:start_date, ": Impossible de réserver un rendez-vous dans le passé") unless start_date > DateTime.now
  end

end
