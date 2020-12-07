class RemoveImageFromGardens < ActiveRecord::Migration[5.2]
  def change
    remove_column :gardens, :image_url, :string
  end
end
