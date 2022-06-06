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

  # def three_most_popular
  #   hi = ingredients
  #   .select("ingredients.name")
  #   .group("count(ingredients) as popular")
  #   .order("popular")
  #   .limit(3)
  # end
end
