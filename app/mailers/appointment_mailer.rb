class AppointmentMailer < ApplicationMailer


  def new_app_guest(appointment)
    @appointment = appointment
    @guest = @appointment.guest

    mail(to: @guest.email, subject: 'Votre demande de rendez-vous a été envoyée !')
  end


end
