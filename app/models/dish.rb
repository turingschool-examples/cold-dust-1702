class Dish < ApplicationRecord
  validates_presence_of :name, :description

  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def the_cook
    self.chef.name
  end

  def total_calories
    # self.joins(:ingredients)
    # .select('sum(ingredients.calories)')
    # .pluck(:sum)
    ingredients.map do |ingredient|
      ingredient.calories
    end.sum
  end
end
