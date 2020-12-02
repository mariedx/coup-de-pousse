class Category < ApplicationRecord
  has_many :garden_categories
  has_many :gardens, through: :garden_categories
end
