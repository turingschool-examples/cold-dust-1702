class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def used_ingredients
    ingredients.select('ingredients.name').distinct(:name).pluck(:name)
  end

  def favorite_ingredients
    ingredients.group('ingredients.id').order(Arel.sql('count(ingredients.id) desc')).limit(3)
  end
end
