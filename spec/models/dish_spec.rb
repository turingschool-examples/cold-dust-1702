require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredient_dishes)}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end

  describe 'methods' do
    it 'counts the total calories for a dish' do
      chef_1 = Chef.create!(name: "Mike Tyson")
      dish_1 = chef_1.dishes.create!(name: "The Knockout", description: "lots of food on this one")

      ingredient_1 = Ingredient.create!(name:"Tomato", calories: 85)
      ingredient_2 = Ingredient.create!(name:"Rice", calories: 185)

      IngredientDish.create!(ingredient_id: ingredient_1.id, dish_id: dish_1.id)
      IngredientDish.create!(ingredient_id: ingredient_2.id, dish_id: dish_1.id)

      expect(dish_1.total_calories).to eq(270)

    end
  end
end
