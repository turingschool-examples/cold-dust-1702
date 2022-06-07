require 'rails_helper'

RSpec.describe 'the chef show page' do
  before(:each)do
    @wolfgang = Chef.create!(name: "Wolfgang Puck")

    @spaghetti = @wolfgang.dishes.create!(name: "Spaghetti", description: "Red sauce and meatballs")
    @penne = @wolfgang.dishes.create!(name: "Penne", description: "White Sauce and spinach")
    @macaroni = @wolfgang.dishes.create!(name: "Macaroni", description: "Four cheese")

    @pasta = Ingredient.create!(name: "Pasta noodles", calories: 300)
    @tomatoes = Ingredient.create!(name: "Tomatoes", calories: 25)
    @meatballs = Ingredient.create!(name: "Meatballs", calories: 456)
    @sauce = Ingredient.create!(name: "Pasta Sauce", calories: 157)
    @cheese = Ingredient.create!(name: "Parmesan", calories: 215)
    @veggies = Ingredient.create!(name: "Vegetable blend", calories: 65)

    DishIngredient.create!(dish: @spaghetti, ingredient: @pasta)
    DishIngredient.create!(dish: @spaghetti, ingredient: @tomatoes)
    DishIngredient.create!(dish: @penne, ingredient: @sauce)
    DishIngredient.create!(dish: @penne, ingredient: @veggies)
    DishIngredient.create!(dish: @macaroni, ingredient: @pasta)
    DishIngredient.create!(dish: @macaroni, ingredient: @cheese)
  end

  it 'displays name of chef' do
    visit "/chefs/#{@wolfgang.id}"

    expect(page).to have_content(@wolfgang.name)
  end
end
