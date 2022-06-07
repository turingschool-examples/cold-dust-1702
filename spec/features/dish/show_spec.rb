require 'rails_helper'

RSpec.describe 'the dish show page' do
  it 'displays dish name and description along with list of ingredients and chef name' do
    chef1 = Chef.create!(name: "Eric")
    dish1 = chef1.dishes.create!(name: "nachos", description: "cheesy dish!")
    ingredient1 = Ingredient.create!(name: "cheese", calories: 120)
    ingredient2 = Ingredient.create!(name: "chips", calories: 140)
    ingredient3 = Ingredient.create!(name: "jalapenos", calories: 30)
    visit "/dishes/#{dish1.id}"
    expect(page).to have_content("Name: #{dish1.name}")
    expect(page).to have_content("description: #{dish1.description}")
    expect(page).to have_content("ingredients: #{ingredient1.name}, #{ingredient2.name}, #{ingredient3.name}")
    expect(page).to have_content("chef: #{chef1.name}")
  end
end
