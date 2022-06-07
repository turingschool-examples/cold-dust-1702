require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "relationships" do
    it { should have_many :dishes }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  let!(:chef1) { Chef.create!(name: "Marion") }
  let!(:chef2) { Chef.create!(name: "Maangchi") }

  let!(:dish1) { chef1.dishes.create!(name: 'Fancy Mac', description: "Hands down the best mac you've ever had!") }
  let!(:dish2) { chef2.dishes.create!(name: 'Fancy Ramen', description: "Add a ramen egg to it!") }
  let!(:dish3) { chef2.dishes.create!(name: 'Korean Seaweed Soup', description: "Good health forever!") }
  let!(:dish4) { chef2.dishes.create!(name: 'Tofu Noodle', description: "Noodles every day!") }

  let!(:ingredient1) { Ingredient.create!(name: 'Curly Noodles', calories: 150) }
  let!(:ingredient2) { Ingredient.create!(name: 'Cheese', calories: 200) }
  let!(:ingredient3) { Ingredient.create!(name: 'Tofu', calories: 100) }
  let!(:ingredient4) { Ingredient.create!(name: 'Seaweed', calories: 50) }

  let!(:dish_ingredient1) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id) }
  let!(:dish_ingredient2) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id) }
  let!(:dish_ingredient3) { DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingredient3.id) }
  let!(:dish_ingredient4) { DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingredient4.id) }
  let!(:dish_ingredient5) { DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingredient1.id) }
  let!(:dish_ingredient6) { DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient1.id) }
  let!(:dish_ingredient8) { DishIngredient.create!(dish_id: dish4.id, ingredient_id: ingredient3.id) }
  let!(:dish_ingredient9) { DishIngredient.create!(dish_id: dish4.id, ingredient_id: ingredient1.id) }

  describe '#unique_ingredients' do
    it "lists all ingredients a chef uses" do
      expect(chef2.unique_ingredients).to eq(['Tofu', 'Seaweed', 'Curly Noodles'])
    end
  end

  describe '#most_popular_ingredients' do
    xit "displays the three most popular ingredients that the chef uses in their dishes" do
      expect(chef2.most_popular_ingredients).to eq(['Curly Noodles', 'Tofu', 'Seaweed'])
    end
  end
end
