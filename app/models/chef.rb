class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :dish_ingredients, through: :dishes
  has_many :ingredients, through: :dish_ingredients

  def ingredient_list
    ingredients.distinct
  end

  def top_ingredients
    # would love to see how to do this in AR, couldn't figure out
    # counter cache so I thought ruby was better than nothing.

    count = Hash.new(0)
    ingredients.each do |i|
      count.key?(i) ? count[i] += 1 : count[i] = 1
    end
    count.sort_by { |k, v| -v }.first(3).map(&:first)
  end
  
end
