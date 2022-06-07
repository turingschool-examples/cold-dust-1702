require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "instance methods" do
    it '#calorie_count' do
      chef_1 = Chef.create!(name: "Lee Kwan Yew")
      dish_1 = chef_1.dishes.create!(name:"Chicken Rice", description: "This is a local Singaporean dish")
      ingredient_1 = Ingredient.create!(name: "chicken", calories: 1000)
      ingredient_2 = Ingredient.create!(name: "rice", calories: 600)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)

      expect(dish_1.calorie_count).to eq(1600)
    end
  end
end
