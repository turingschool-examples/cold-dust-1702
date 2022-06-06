class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def popular_ingredients
    ingredients.group(:id)
               .select('ingredients.*, count(ingredients) as ingredient_count')
               .order(ingredient_count: :desc)
               .limit(3)
  end
end
