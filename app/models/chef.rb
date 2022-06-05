class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def most_used
    ingredients.group('ingredients.id').order('count(ingredients.id) desc').limit(3)
  end

  def ingredients_used
    ingredients.select('ingredients.name').group(:name)
  end
end
