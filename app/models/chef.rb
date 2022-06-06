class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def no_duplicates
    ingredients.distinct
  end

  def most_popular
    # binding.pry
    ingredients
    .group(:id)
    .select('ingredients.name, count(ingredients.name)')
    .order(count: :desc)
    .limit(3)
    .pluck(:name)
  end
end
