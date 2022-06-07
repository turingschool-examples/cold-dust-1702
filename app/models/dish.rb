class Dish < ApplicationRecord
  validates_presence_of :name, :description

  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def the_cook
    self.chef.name
  end
end
