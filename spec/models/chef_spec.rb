require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe 'instance methods' do
    before do
      @chef1 = Chef.create!(name: "Rob")

      dish1 = @chef1.dishes.create!(name: "Pancakes", description: "Stack of 3 fluffy pancakes")
      dish2 = @chef1.dishes.create!(name: "Omelette", description: "Served with home fries")
      dish3 = @chef1.dishes.create!(name: "Skillet", description: "Eggs, veg, and homies")
      dish4 = @chef1.dishes.create!(name: "Crepes", description: "Berry and Brie")

      @milk = Ingredient.create!(name: "milk", calories: 90)
      @flour = Ingredient.create!(name: "flour", calories: 60)
      @eggs = Ingredient.create!(name: "eggs", calories: 80)
      @potatoes = Ingredient.create!(name: "potatoes", calories: 100)

      DishIngredient.create!(dish: dish1, ingredient: @eggs)
      DishIngredient.create!(dish: dish3, ingredient: @eggs)
      DishIngredient.create!(dish: dish2, ingredient: @eggs)
      DishIngredient.create!(dish: dish4, ingredient: @eggs)
      DishIngredient.create!(dish: dish2, ingredient: @potatoes)
      DishIngredient.create!(dish: dish1, ingredient: @potatoes)
      DishIngredient.create!(dish: dish4, ingredient: @potatoes)
      DishIngredient.create!(dish: dish1, ingredient: @milk)
      DishIngredient.create!(dish: dish2, ingredient: @milk)
      DishIngredient.create!(dish: dish1, ingredient: @flour)
    end

    describe 'unique_ingredients' do
      it 'returns a list of all ingredients used by a chef' do
        expect(@chef1.unique_ingredients).to match_array(["milk", "flour", "eggs", "potatoes"])
      end
    end

    describe 'top_ingredients' do
      it "returns the top 3 ingredients a chef uses ordered by popularity" do
        expect(@chef1.top_ingredients).to eq([@eggs, @potatoes, @milk])

      end
    end

  end
end
