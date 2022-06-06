class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def unique_ingredients
    ingredients.distinct.pluck(:name)
  end

  def top_ingredients
    ingredients
    .group(:id)
    .select('ingredients.*, COUNT(ingredients.id)')
    .order('count desc')
    .limit(3)
  end
end
