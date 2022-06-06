class DishIngredient < ApplicationRecord
  validates_presence_of :dish_id, :ingredient_id
  belongs_to :dish
  belongs_to :ingredient
end
