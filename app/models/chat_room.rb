class ChatRoom < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :messages, dependent: :destroy
  after_create :new_conversation_email

  # emails methods

  def new_conversation_email
    ConversationMailer.new_chat_room(self).deliver_now
  end

  def pen_pal(user)

    if user.id == self.sender_id
      self.receiver.name
    else
      self.sender.name
    end

  end


end

