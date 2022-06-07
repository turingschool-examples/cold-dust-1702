class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes, dependent: :destroy
  has_many :dish_ingredients, through: :dishes, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients, dependent: :destroy

  def unique_ingredients
    ingredients.select('ingredients.*, ingredients.name').group(:id)
  end

  def popular_ingredients
    ingredients.select("ingredients.*, count(ingredients.name) as count")
               .group(:id)
               .order(count: :desc)
               .limit(3)
  end
end
