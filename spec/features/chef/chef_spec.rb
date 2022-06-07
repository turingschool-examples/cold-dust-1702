require 'rails_helper'

RSpec.describe 'the chef show page' do
  it 'displays chef name and links to unique ingredients' do
    chef1 = Chef.create!(name: "Eric")
    dish1 = chef1.dishes.create!(name: "nachos", description: "cheesy dish!")
    ingredient1 = Ingredient.create!(name: "cheese", calories: 120)
    ingredient2 = Ingredient.create!(name: "chips", calories: 140)
    ingredient3 = Ingredient.create!(name: "jalapenos", calories: 30)
    ingredient4 = Ingredient.create!(name: "cream cheese", calories: 70)
    dishingredient1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id)
    dishingredient2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id)
    dishingredient3 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient3.id)
    dishingredient4 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient3.id)
    visit "/chefs/#{chef1.id}"
    expect(page).to have_content("#{chef1.name}")
    expect(page).to have_link("All Ingredients")
    expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")
    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(ingredient3.name)
  end
end
