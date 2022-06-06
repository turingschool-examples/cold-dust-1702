class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes


  def unique_ingredients
    ingredients
    .select("ingredients.name")
    .order("ingredients.name")
    .distinct
    .pluck("ingredients.name")
  end
end
