class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :city
      t.string :street_number
      t.string :street_name
      t.string :street
      t.string :department
      t.string :department_code
      t.string :country
      t.string :country_code
      t.float :lat
      t.float :lng
      t.belongs_to :garden, index: true

      t.timestamps
    end
  end
end
