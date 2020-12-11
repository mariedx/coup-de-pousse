class ConversationMailer < ApplicationMailer

  def new_chat_room(chatroom)
    @chat_room = chatroom
    @receiver = @chat_room.receiver

    mail(to: @receiver.email, subject: 'Oh chouette, une nouvelle conversation !')
  end



end
