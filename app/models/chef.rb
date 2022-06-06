class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def ingredients_uniq
    ingredients.pluck(:name).uniq    
  end
end
