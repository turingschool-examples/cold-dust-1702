class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def all_ingredients
    ingredients.select('ingredients.*')
      .group(:id)
  end

  def most_popular_three
    ingredients.select('ingredients.*').group(:id).order(count: :desc).limit(3)
  end
end
