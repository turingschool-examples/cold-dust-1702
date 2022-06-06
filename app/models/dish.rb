class Dish < ApplicationRecord
  validates_presence_of :name, :description
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
  belongs_to :chef

  def total_calorie_count
    ingredients.sum(:calories)
  end
end
