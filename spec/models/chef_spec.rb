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

      @chicken = Ingredient.create!(name: "Chicken", calories: 400)
      @noodles = Ingredient.create!(name: "Noodles", calories: 200)
      @sausage = Ingredient.create!(name: "Sausage", calories: 500)
      @peppers = Ingredient.create!(name: "Bell Pepper", calories: 50)
      @shrimp = Ingredient.create!(name: "Shrimp", calories: 200)

      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @chicken.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @peppers.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @noodles.id)
      DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @sausage.id)    
      DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @shrimp.id)    
      DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @noodles.id)   
    end

    it 'returns the ingredients a chef uses' do
      expect(@chef_1.ingredients).to eq([@chicken, @noodles, @sausage, @peppers])
      expect(@chef_2.ingredients).to eq([@shrimp, @noodles])
    end
  end
end
