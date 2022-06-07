class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def chef_ingredients
    ingredients.group('ingredients.id')
  end

  def top_3_ingredients
    ingredients.group('ingredients.id').order('count(ingredients.id) desc').limit(3)
  end
end
