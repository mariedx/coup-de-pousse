class Garden < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :garden_categories
  has_many :categories, through: :garden_categories
  has_many :favorites, :dependent => :destroy
  has_many :comments
  has_one_attached :picture

  def to_param
    [id, title.parameterize].join("-")
  end

end
