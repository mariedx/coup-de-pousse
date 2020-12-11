class AppointmentMailer < ApplicationMailer


  def new_app_guest(appointment)
    @appointment = appointment
    @guest = @appointment.guest

    mail(to: @guest.email, subject: 'Votre demande de rendez-vous a été envoyée !')
  end

  def new_app_host(appointment)
    @appointment = appointment
    @host = @appointment.host

    mail(to: @host.email, subject: "Quelqu'un veut jardiner avec vous !")
  end

  def delete_app_guest(appointment)
    @appointment = appointment
    @guest = @appointment.guest

    mail(to: @guest.email, subject: 'Un rendez-vous a été supprimé !')
  end

  def delete_app_host(appointment)
    @appointment = appointment
    @host = @appointment.host

    mail(to: @host.email, subject: "Un rendez-vous a été supprimé")
  end


end
