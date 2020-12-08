class AddUsersToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :chat_rooms, :sender, index: true
    add_reference :chat_rooms, :receiver, index: true
  end
end
