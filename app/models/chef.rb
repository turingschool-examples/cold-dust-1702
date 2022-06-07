class Chef < ApplicationRecord
  has_many :dishes
  has_many :dish_ingredients, through: :dishes
  has_many :ingredients, through: :dish_ingredients

  validates_presence_of :name

  def unique_ingredients
     dishes.joins(dish_ingredients: :ingredient).select("ingredients.*").pluck("ingredients.name").uniq
  end

  def most_popular_ingredients
    ingredients
    .joins(:dish_ingredients)
    .select("ingredients.name, COUNT(dish_ingredients) AS num")
    .group(:name)
    .order(num: :desc)
    .limit(3)
    # .pluck(:name)
    # why doesn't pluck(:name) work here ??????
  end
end
