class Garden < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :garden_categories
  has_many :categories, through: :garden_categories
  has_many   :favorites, :dependent => :destroy

  def to_param
    [id, title.parameterize].join("-")
  end
end
