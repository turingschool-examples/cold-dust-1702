class DishIngredient < ApplicationRecord
  # validates_presence_of :calories
  belongs_to :dish
  belongs_to :ingredient
end
