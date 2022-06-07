class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    dishes.joins(ingredients: :dish_ingredients).select('ingredients.name').distinct
  end

  def top_three_ing
    x = dishes.joins(ingredients: :dish_ingredients)
                .select('ingredients.name, count(ingredients.name)')
                .order(count: :desc)
                .group('ingredients.name')
                .limit(3)
                binding.pry
  end
end
