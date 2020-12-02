class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :title
      t.text :description
      t.string :orientation
      t.string :floor_type
      t.boolean :is_available
      t.boolean :parking
      t.boolean :tools_available
      t.integer :surface
      t.string :image_url
      t.belongs_to :user, index: true
      t.belongs_to :address, index: true

      t.timestamps
    end
  end
end
