class Chef < ApplicationRecord
  has_many :dishes

  validates_presence_of :name

  def all_ingredients
     dishes.joins(dish_ingredients: :ingredient).select("ingredients.*").pluck("ingredients.name")
  end
end
