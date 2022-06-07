require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "instance methods" do
    it 'can count total calories of a dish' do
      chef1 = Chef.create!(name: "Eric")
      dish1 = chef1.dishes.create!(name: "nachos", description: "cheesy dish!")
      ingredient1 = Ingredient.create!(name: "cheese", calories: 120)
      ingredient2 = Ingredient.create!(name: "chips", calories: 140)
      ingredient3 = Ingredient.create!(name: "jalapenos", calories: 30)
      dishingredient1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id)
      dishingredient2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id)
      dishingredient3 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient3.id)

      expect(dish1.total_calories).to eq(290)
    end
  end
end
