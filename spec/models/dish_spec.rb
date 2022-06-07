require 'rails_helper'

RSpec.describe Dish, type: :model do
  let!(:chef1) { Chef.create!(name: "Marion") }
  let!(:chef2) { Chef.create!(name: "Maangchi") }

  let!(:dish1) { chef1.dishes.create!(name: 'Fancy Mac', description: "Hands down the best mac you've ever had!") }
  let!(:dish2) { chef1.dishes.create!(name: 'Fancy Ramen', description: "Add a ramen egg to it!") }
  let!(:dish3) { chef2.dishes.create!(name: 'Korean Seaweed Soup', description: "Good health forever!") }

  let!(:ingredient1) { Ingredient.create!(name: 'Curly Noodles', calories: 150) }
  let!(:ingredient2) { Ingredient.create!(name: 'Cheese', calories: 200) }
  let!(:ingredient3) { Ingredient.create!(name: 'Tofu', calories: 100) }

  let!(:dish_ingredient1) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id) }
  let!(:dish_ingredient2) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id) }
  let!(:dish_ingredient3) { DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient3.id) }

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe '#total_calories' do
    it "counts the total calories of a dish" do
      expect(dish1.total_calories).to eq(350)
    end
  end
end
