require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "class methods" do
    describe "#dish_calories" do
      it "can count the calories in a dish" do
        lou = Chef.create!(name: "Lou Baron")
        pizza = lou.dishes.create!(name: "Cheese Pizza", description: "A delightfully light cheese covered peice of bread!")
        calzone = lou.dishes.create!(name: "Beef Calzone", description: "Beef and cheese in a folded peice of bread!")
        cheese = Ingredient.create!(name: "Cheese", calories: 25)
        beef = Ingredient.create!(name: "Beef", calories: 50)
        bread = Ingredient.create!(name: "Bread", calories: 500)
        dish_ingredient1 = DishIngredient.create!(dish_id: pizza.id, ingredient_id: cheese.id)
        dish_ingredient1 = DishIngredient.create!(dish_id: pizza.id, ingredient_id: bread.id)
        dish_ingredient1 = DishIngredient.create!(dish_id: calzone.id, ingredient_id: cheese.id)
        dish_ingredient1 = DishIngredient.create!(dish_id: calzone.id, ingredient_id: beef.id)
        dish_ingredient1 = DishIngredient.create!(dish_id: calzone.id, ingredient_id: bread.id)

        expect(Dish.dish_calories).to eq(575)
      end
    end
  end
end
