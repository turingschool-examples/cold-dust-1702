require 'rails_helper'

RSpec.describe 'Chefs Show Page' do
  let!(:chef) { Chef.create!(name: 'Remy') }

  let!(:dish) { chef.dishes.create!(name: 'Salad', description: 'Green and leafy!') }
  let!(:dish2) { chef.dishes.create!(name: 'Soup', description: 'Soup of the day!') }
  let!(:dish3) { chef.dishes.create!(name: 'Sandwich', description: 'Two pieces of bread and some other stuff') }

  let!(:ingredient1) { Ingredient.create!(name: 'Kale', calories: 100) }
  let!(:ingredient2) { Ingredient.create!(name: 'Tomato', calories: 50) }
  let!(:ingredient3) { Ingredient.create!(name: 'Mushroom', calories: 150) }
  let!(:ingredient4) { Ingredient.create!(name: 'Bread', calories: 120) }

  let!(:dish_ingredient1) { DishIngredient.create!(dish: dish, ingredient: ingredient1) }
  let!(:dish_ingredient2) { DishIngredient.create!(dish: dish, ingredient: ingredient2) }
  let!(:dish_ingredient3) { DishIngredient.create!(dish: dish2, ingredient: ingredient3) }
  let!(:dish_ingredient4) { DishIngredient.create!(dish: dish2, ingredient: ingredient2) }
  let!(:dish_ingredient5) { DishIngredient.create!(dish: dish3, ingredient: ingredient4) }
  let!(:dish_ingredient6) { DishIngredient.create!(dish: dish3, ingredient: ingredient2) }
  let!(:dish_ingredient7) { DishIngredient.create!(dish: dish3, ingredient: ingredient1) }
  it 'has chefs name' do
    visit chef_path(chef.id)

    expect(page).to have_content('Remy')
  end

  it 'links to chefs ingredients index page' do
    visit chef_path(chef.id)

    expect(page).to have_link('Ingredients')
    click_link 'Ingredients'
    expect(current_path).to eq(chef_ingredients_path(chef.id))
  end

  it 'lists 3 most popular ingredients' do
    visit chef_path(chef.id)

    expect(page).to have_content('Kale')
    expect(page).to have_content('Tomato')
    expect(page).to have_content('Bread')
    expect(page).to_not have_content('Mushroom')
  end
end
