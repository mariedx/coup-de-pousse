class RemoveUserFromChatRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :chat_rooms, :user_id
  end
end
