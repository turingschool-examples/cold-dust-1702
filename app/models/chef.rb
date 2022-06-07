class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def popular_ingredients
    # require "pry";binding.pry
  end
end
