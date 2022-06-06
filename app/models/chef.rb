class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes
  def three_most_popular_ingredients
    # Chef.joins(:ingredients).group(:id).order('COUNT (ingredients.id) desc').distinct.limit(3)
  end
end
