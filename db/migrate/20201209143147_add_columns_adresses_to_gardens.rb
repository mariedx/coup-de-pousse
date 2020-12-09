class AddColumnsAdressesToGardens < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :street_number, :string
    add_column :gardens, :street_name, :string
    add_column :gardens, :zip_code, :string
    add_column :gardens, :city, :string
    add_column :gardens, :country, :string
    add_column :gardens, :latitude, :float
    add_column :gardens, :longitude, :float    
  end
end
