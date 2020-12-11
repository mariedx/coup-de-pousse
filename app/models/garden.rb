class Garden < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :garden_categories
  has_many :categories, through: :garden_categories
  has_many :favorites, :dependent => :destroy
  has_many :comments
  has_one_attached :picture
  geocoded_by :address
  after_validation :geocode

  def address
    [street_number, street_name, zip_code, city, country].compact.join(', ')
  end

  #Add a search bar classifying all the gardens depending on their city
  def self.search(query)
    if query
      self.where(city: query).first
    else 
      Garden.all
    end
  end

end
