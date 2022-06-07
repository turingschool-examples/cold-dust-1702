require 'rails_helper'

RSpec.describe "Chef#Show" do
  it "displays the name of the chef" do
    chef = Chef.create!(name: "Julia Adults")

    visit chef_path(chef)

    expect(page).to have_content("Name: Julia Adults")
  end

  it "has a link to ingredients index" do
    chef = Chef.create!(name: "Julia Adults")

    visit chef_path(chef)

    expect(page).to have_link("All Ingredients")
    click_link("All Ingredients")

    expect(current_path).to eq(chef_ingredients_path(chef))
  end

  it "lists this chef's most popular ingredients" do
    chef = Chef.create!(name: "Julia Adults")
    dish1 = chef.dishes.create!(name: "Pizza", description: "It's a pizza.")
    ingre1 = Ingredient.create!(name: "dough", calories: 200)
    ingre2 = Ingredient.create!(name: "sauce", calories: 30)
    ingre3 = Ingredient.create!(name: "cheese", calories: 100)
    dish_ingre1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre1.id) #
    dish_ingre2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre2.id) ####
    dish_ingre3 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre3.id) ###

    dish2 = chef.dishes.create!(name: "Pasta", description: "It's pasta.")
    ingre4 = Ingredient.create!(name: "spaghetti", calories: 200)
    ingre5 = Ingredient.create!(name: "meatball", calories: 150)
    dish_ingre4 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre4.id) #
    dish_ingre5 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre2.id) ####
    dish_ingre6 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre3.id) ###
    dish_ingre7 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre5.id) ##

    dish3 = chef.dishes.create!(name: "Meatball Sub", description: "It's a meatball sub.")
    ingre6 = Ingredient.create!(name: "bread", calories: 200)
    dish_ingre8 = DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingre5.id) ##
    dish_ingre9 = DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingre6.id) #
    dish_ingre9 = DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingre3.id) ###
    dish_ingre10 = DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingre2.id) ####

    dish4 = chef.dishes.create!(name: "Just Sauce", description: "Seriously, it's just pasta sauce.")
    dish_ingre11 = DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingre2.id) ####

    visit chef_path(chef)
save_and_open_page
    within "#favorite_ingredients" do
      expect(page).to have_content("sauce")
      expect(page).to have_content("cheese")
      expect(page).to have_content("meatball")
      expect(page).to_not have_content("bread")
    end
  end
end
