class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :dish_ingredients, through: :dishes
  has_many :ingredients, through: :dish_ingredients

  def unique_ingredients
    ingredients.distinct
  end

  def top_3_ingredients
    ingredients
    .select("ingredients.*, count(ingredients.id) AS total_count")
    .group("ingredients.id")
    .order(total_count: :desc)
    .order(:id)
    .limit(3)
  end
end
