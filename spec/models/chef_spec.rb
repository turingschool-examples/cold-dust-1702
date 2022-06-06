require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do 
    
    before :each do 
      @chef_1 = Chef.create!(name: "Thomas")
      @chef_2 = Chef.create!(name: "Maya")

      @dish_1 = @chef_1.dishes.create!(name: "Chicken Enchiladas", description: "Spicy enchiladas covered in cheese")
      @dish_2 = @chef_1.dishes.create!(name: "Roasted Chicken Linguini", description: "Creamy pasta")
      @dish_3 = @chef_1.dishes.create!(name: "Baked Ziti", description: "Red sauce with italian sausage")
      @dish_4 = @chef_2.dishes.create!(name: "Shrimp pasta", description: "Rose sauce with sauteed shrimp")
      @dish_5 = @chef_1.dishes.create!(name: "Chicken Spaghetti", description: "Bell peppers and creamy chicken sauce")

      @chicken = Ingredient.create!(name: "Chicken", calories: 400)
      @noodles = Ingredient.create!(name: "Noodles", calories: 200)
      @sausage = Ingredient.create!(name: "Sausage", calories: 500)
      @peppers = Ingredient.create!(name: "Bell Pepper", calories: 50)
      @shrimp = Ingredient.create!(name: "Shrimp", calories: 200)

      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @chicken.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @peppers.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @noodles.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @chicken.id)
      DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @sausage.id)    
      DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @shrimp.id)    
      DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @noodles.id)   
      DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @noodles.id)   
      DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @chicken.id)   
      DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @peppers.id)   
    end

    describe 'chef_ingredients' do
      it 'returns the ingredients a chef uses' do
        expect(@chef_1.chef_ingredients).to eq(["Bell Pepper", "Chicken", "Noodles", "Sausage"])
        expect(@chef_2.chef_ingredients).to eq(["Noodles", "Shrimp"])
      end
    end

    describe 'top_3_ingredients' do
      it 'returns the three most populat ingredients the chef uses' do
        expect(@chef_1.top_3_ingredients).to eq(["Bell Pepper", "Chicken", "Noodles"])
      end
    end
  end
end
