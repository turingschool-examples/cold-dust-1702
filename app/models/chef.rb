class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def all_ingredients
    ingredients.select('ingredients.*')
      .group(:id)
  end
end
