require 'rails_helper'

RSpec.describe "Dishes Show Page" do
  it 'shows dishes name, list of all ingredients, and chefs name' do
  # As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # And I see the chef's name
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

  visit "/dishes/#{pizza.id}"
  save_and_open_page
  expect(page).to have_content("Dish:")
  expect(page).to have_content("Cheese Pizza")
  expect(page).to have_content("Ingredients:")
  expect(page).to have_content("Cheese")
  expect(page).to have_content("Bread")
  expect(page).to have_content("Lou Baron")
  expect(page).to_not have_content("Beef Calzone")
  end

  it "shows a calorie count for the dish" do
    # As a visitor
    # When I visit a dish's show page
    # I see the total calorie count for that dish.
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

    visit "/dishes/#{calzone.id}"

    expect(page).to have_content("Total Calories:")
    expect(page).to have_content("575")
  end
end
