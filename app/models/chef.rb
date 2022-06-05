class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes, dependent: :destroy
  has_many :dish_ingredients, through: :dishes, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients, dependent: :destroy
end
