class CreateGardenCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :garden_categories do |t|

      t.belongs_to :garden, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
