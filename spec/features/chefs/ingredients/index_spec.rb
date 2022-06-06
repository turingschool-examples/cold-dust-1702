require 'rails_helper'

RSpec.desribe "Ingredients Index Page" do
  it "shows ingredients used by this chef" do
    chef = Chef.create!(name: "Julia Adults")
    dish1 = chef.dishes.create!(name: "Pizza", description: "It's a pizza.")
    ingre1 = Ingredient.create!(name: "dough", calories: 200)
    ingre2 = Ingredient.create!(name: "sauce", calories: 30)
    ingre3 = Ingredient.create!(name: "cheese", calories: 100)
    dish_ingre1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre1.id)
    dish_ingre2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre2.id)
    dish_ingre3 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre3.id)

    dish2 = chef.dishes.create!(name: "Pasta", description: "It's pasta.")
    ingre4 = Ingredient.create!(name: "spaghetti", calories: 200)
    dish_ingre4 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre4.id)
    dish_ingre5 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre2.id)
    dish_ingre6 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingre3.id)

    visit chef_ingredients_path(chef)

    expect(page).to have_content("dough")
    expect(page).to have_content("sauce", count: 1)
    expect(page).to have_content("cheese", count: 1)
    expect(page).to have_content("spaghetti")
  end
end
