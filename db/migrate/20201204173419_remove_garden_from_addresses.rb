class RemoveGardenFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :garden_id, index: true, foreign_key: true
  end
end
