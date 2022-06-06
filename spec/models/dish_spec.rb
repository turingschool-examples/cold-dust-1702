require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe 'relationships' do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "instance methods" do
    it ".total_calories" do
      chef = Chef.create!(name: "Julia Adults")
      dish1 = chef.dishes.create!(name: "Pizza", description: "It's a pizza.")
      ingre1 = Ingredient.create!(name: "dough", calories: 200)
      ingre2 = Ingredient.create!(name: "sauce", calories: 30)
      ingre3 = Ingredient.create!(name: "cheese", calories: 100)
      dish_ingre1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre1.id)
      dish_ingre2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre2.id)
      dish_ingre3 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre3.id)

      expect(dish1.total_calories).to eq(330)
    end
  end
end
