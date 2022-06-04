class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :dish_ingredients, through: :dishes 
  has_many :ingredients, through: :dish_ingredients

  def unique_ingredients
    self.ingredients.select(:name).distinct.pluck(:name)
  end

#   def most_popular_ingredients
#     require 'pry'; binding.pry
#     ingredients
#     .select(:name)
#     .select("ingredients.*, sum(dishes.count * ingredients.count)")
#     .group(:id)
#     .order(sum: :desc)
#     .limit(3).to_a
#   end
end

# Extension
# As a visitor
# When I visit a chef's show page
# I see the three most popular ingredients that the chef uses in their dishes
# (Popularity is based off of how many dishes use that ingredient)