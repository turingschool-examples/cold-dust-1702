require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe "instance methods" do
    before(:each) do
      @wolfgang = Chef.create!(name: "Wolfgang Puck")

      @spaghetti = @wolfgang.dishes.create!(name: "Spaghetti", description: "Red sauce and meatballs")
      @penne = @wolfgang.dishes.create!(name: "Penne", description: "White Sauce and spinach")
      @macaroni = @wolfgang.dishes.create!(name: "Macaroni", description: "Four cheese")
      @meatball_sub = @wolfgang.dishes.create!(name: "Meatball Sub", description: "Delicious sandwich")
      @lasagna = @wolfgang.dishes.create!(name: "Lasagna", description: "Saucy cheesy")


      @pasta = Ingredient.create!(name: "Pasta noodles", calories: 300)
      @tomatoes = Ingredient.create!(name: "Tomatoes", calories: 25)
      @meatballs = Ingredient.create!(name: "Meatballs", calories: 456)
      @sauce = Ingredient.create!(name: "Pasta Sauce", calories: 157)
      @cheese = Ingredient.create!(name: "Parmesan", calories: 215)
      @veggies = Ingredient.create!(name: "Vegetable blend", calories: 65)

      DishIngredient.create!(dish: @spaghetti, ingredient: @pasta)
      DishIngredient.create!(dish: @spaghetti, ingredient: @tomatoes)
      DishIngredient.create!(dish: @spaghetti, ingredient: @meatballs)
      DishIngredient.create!(dish: @penne, ingredient: @pasta)
      DishIngredient.create!(dish: @penne, ingredient: @sauce)
      DishIngredient.create!(dish: @macaroni, ingredient: @pasta)
      DishIngredient.create!(dish: @macaroni, ingredient: @cheese)
      DishIngredient.create!(dish: @meatball_sub, ingredient: @meatballs)
      DishIngredient.create!(dish: @meatball_sub, ingredient: @cheese)
      DishIngredient.create!(dish: @lasagna, ingredient: @pasta)
      DishIngredient.create!(dish: @macaroni, ingredient: @cheese)
    end

    it 'determines most popular ingredients used by the chef' do
      expect(@wolfgang.popular_ingredients).to eq([@pasta, @cheese, @meatballs])
    end


  end
end
