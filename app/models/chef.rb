class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def ingredients_uniq
    ingredients.pluck(:name).uniq    
  end

  def top_3_ingredients
    ingredients
    .select('ingredients.name, count(ingredients.name) AS nc')
    .group('ingredients.name')
    .order(nc: :desc)
    .limit(3)
  end
end
