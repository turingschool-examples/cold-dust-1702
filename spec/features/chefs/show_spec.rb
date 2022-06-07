require 'rails_helper'

RSpec.describe "Dishes Show Page" do
  it 'shows the chefs name, link to the ingredients, can click link, goes to chefs ingredients page, lists unique ingredients used by chef' do
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
    # As a visitor
    # When I visit a chef's show page
    # I see the name of that chef
    # And I see a link to view a list of all ingredients that this chef uses in their dishes
    # When I click on that link
    # I'm taken to a chef's ingredient index page
    visit "/chefs/#{lou.id}"
    save_and_open_page
    expect(page).to have_content("Chef Lou Baron")
    expect(page).to have_link("Chef's Ingredients")
    click_link "Chef's Ingredients"
    expect(current_path).to eq("/chefs/#{lou.id}/ingredients")
    # and I can see a unique list of names of all the ingredients that this chef uses
  end
end
