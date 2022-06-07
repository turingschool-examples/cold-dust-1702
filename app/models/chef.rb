class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def chef_ingredients
    ingredients.distinct
  end

  def popular_ingredients
    ingredients.group(:id)
              .select("ingredients.*, count(ingredients)")
              .order(count: :desc)
              .limit(3)   
  end
end
