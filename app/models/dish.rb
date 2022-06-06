class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :ingredients


def total_calories
  ingredients.sum(:calories)
  end
end
