class Garden < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :appointments
  has_many :garden_categories
  has_many :categories, through: :garden_categories
  has_many   :favorites, :dependent => :destroy

  def to_param
    [id, title.parameterize].join("-")
  end

  def self.search(search)
    if search
      address = Address.where(city: search)
      if address
        self.where(address_id: address)
      else
        Garden.all
      end
    else
      Garden.all
    end
  end

end
