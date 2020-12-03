class GuestMailer < ApplicationMailer

  def app_send_email (guest, appointment)

    @guest = current_user
    @appointment = appointment

    mail(to: @guest.email, subject: `Votre demande de rendez-vous a été envoyé !`)


  end

end
