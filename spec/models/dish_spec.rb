require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to (:chef)}
    it {should have_many(:dishes_ingredients)}
    it {should have_many(:ingredients).through(:dishes_ingredients)}
  end

  describe "instance method" do
    it "can calculate the calories within a dish" do
      chef1 = Chef.create!(name: "Cliff")
      dish1 = chef1.dishes.create!(name: "chicken", description: "good")
      ingredient1 = Ingredient.create!(name: "ginger", calories: 1)
      ingredient2 = Ingredient.create!(name: "sporty", calories: 10)
      ingredient6= Ingredient.create!(name: "old", calories: 100)
      dishes_ingredient1 = ingredient1.dishes_ingredients.create!(dish_id: dish1.id)
      dishes_ingredient2 = ingredient2.dishes_ingredients.create!(dish_id: dish1.id)
      dishes_ingredient11 = ingredient6.dishes_ingredients.create!(dish_id: dish1.id)
    expect(dish1.total_calories).to eq(111)
    end
  end
end