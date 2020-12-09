class RemoveReferenceAddressFromGardens < ActiveRecord::Migration[5.2]
  def change
    remove_column :gardens, :address_id, index: true, foreign_key: true
  end
end
