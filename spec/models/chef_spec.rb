require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:dish_ingredients).through(:dishes)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    before :each do
      @chef = Chef.create!(name: 'Charles')
      @chef2 = Chef.create!(name: 'Barkley')
      @dish_1 = @chef.dishes.create!(name: "Fish", description: "Fresh Caught Salmon")
      @dish_2 = @chef.dishes.create!(name: "Steak", description: "Fresh Caught Cow")
      @dish_3 = @chef2.dishes.create!(name: "Fruit", description: "Fresh Berries")
      @ingredient_1 = Ingredient.create!(name: "Wild Salmon", calories: 100)
      @ingredient_2 = Ingredient.create!(name: "Carrots", calories: 50)
      @ingredient_3 = Ingredient.create!(name: "Steak", calories: 200)
      @ingredient_4 = Ingredient.create!(name: "Blueberries", calories: 20)
      @ingredient_5 = Ingredient.create!(name: "Squash", calories: 100)
      @ingredient_6 = Ingredient.create!(name: "Pumpkin", calories: 50)
      @ingredient_7 = Ingredient.create!(name: "Butter", calories: 200)
      @ingredient_8 = Ingredient.create!(name: "Salt", calories: 20)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_7)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_8)
      DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
      DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
      DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_7)
      DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_8)
      DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_4)
    end

    describe "#ingredient_list" do
      it 'returns unique list of ingrediets from a chef' do
        expect(@chef.ingredient_list).to eq([@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_7, @ingredient_8])
      end
    end
    
    describe "#top_ingredients" do
      it 'returns top 3 most used ingredients' do
        expect(@chef.top_ingredients).to eq([@ingredient_2, @ingredient_7, @ingredient_8])
      end
    end
  end
end
