require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe "instance methods" do
    it ".used_ingredients" do
      chef = Chef.create!(name: "Julia Adults")
      dish1 = chef.dishes.create!(name: "Pizza", description: "It's a pizza.")
      ingre1 = Ingredient.create!(name: "dough", calories: 200)
      ingre2 = Ingredient.create!(name: "sauce", calories: 30)
      ingre3 = Ingredient.create!(name: "cheese", calories: 100)
      dish_ingre1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre1.id)
      dish_ingre2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre2.id)
      dish_ingre3 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre3.id)

      dish2 = chef.dishes.create!(name: "Pasta", description: "It's pasta.")
      ingre4 = Ingredient.create!(name: "spaghetti", calories: 200)
      dish_ingre4 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre4.id)
      dish_ingre5 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre2.id)
      dish_ingre6 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre3.id)

      expect(chef.used_ingredients).to eq(["cheese", "dough", "sauce", "spaghetti"])
    end
  end
end
