require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do

    before :each do
      @chef = Chef.create!(name: "Thomas")

      @dish_1 = @chef.dishes.create!(name: "Chicken Enchiladas", description: "Spicy enchiladas covered in cheese")
      @dish_2 = @chef.dishes.create!(name: "Roasted Chicken Linguini", description: "Creamy pasta")
      @dish_3 = @chef.dishes.create!(name: "Baked Ziti", description: "Red sauce with italian sausage")
      
      @chicken = Ingredient.create!(name: "Chicken", calories: 400)
      @noodles = Ingredient.create!(name: "Noodles", calories: 200)
      @sausage = Ingredient.create!(name: "Sausage", calories: 500)
      @peppers = Ingredient.create!(name: "Bell Pepper", calories: 50)
      
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @chicken.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @peppers.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @noodles.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @chicken.id)
      DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @sausage.id)      
      DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @noodles.id)      
    end

    it 'returns the calorie count for a dish' do
      expect(@dish_1.calories).to eq(450)
      expect(@dish_2.calories).to eq(600)
      expect(@dish_3.calories).to eq(700)
    end 

  end
end
