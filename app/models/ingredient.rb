class Ingredient < ApplicationRecord
  validate_presence_of :name, :calories
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
  belongs_to :dish
end
