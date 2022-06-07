class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes


  def drygoods
    ingredients.distinct
  end
end
