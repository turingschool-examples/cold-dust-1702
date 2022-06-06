require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients)}
    it {should have_many(:dish_ingredients)}
  end

  describe 'instance methods' do
    before do
      chef = Chef.create!(name: "Rob")

      dish1 = chef.dishes.create!(name: "Pancakes", description: "Stack of 3 fluffy pancakes")

      milk = Ingredient.create!(name: "milk", calories: 100)
      flour = Ingredient.create!(name: "flour", calories: 60)
      eggs = Ingredient.create!(name: "eggs", calories: 80)

      DishIngredient.create!(dish: dish1, ingredient: milk)
      DishIngredient.create!(dish: dish1, ingredient: flour)
      DishIngredient.create!(dish: dish1, ingredient: eggs)
  end

  describe 'calories' do
    it 'returns the total sum of calories in a dish' do
      expect(dish1.calories).to eq(240)
    end
  end
end
