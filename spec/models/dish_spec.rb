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

  describe "instance methods" do
    before :each do
      @chef = Chef.create!(name: 'Charles')
      @chef2 = Chef.create!(name: 'Barkley')
      @dish_1 = @chef.dishes.create!(name: "Fish", description: "Fresh Caught Salmon")
      @dish_2 = @chef.dishes.create!(name: "Steak", description: "Fresh Caught Cow")
      @ingredient_1 = Ingredient.create!(name: "Wild Salmon", calories: 100)
      @ingredient_2 = Ingredient.create!(name: "Carrots", calories: 50)
      @ingredient_3 = Ingredient.create!(name: "Steak", calories: 200)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
      DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
    end

    describe "#total_calorie_count" do
      it 'calculates the total calories count' do
        expect(@dish_1.total_calorie_count).to eq(150)
      end
    end
  end
  
end
