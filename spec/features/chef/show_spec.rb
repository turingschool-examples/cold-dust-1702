require 'rails_helper'

RSpec.describe 'Chefs Show Page' do
  let!(:chef) { Chef.create!(name: 'Remy') }

  let!(:dish) { chef.dishes.create!(name: 'Salad', description: 'Green and leafy!') }

  let!(:ingredient1) { Ingredient.create!(name: 'Kale', calories: 100, dish: dish) }
  let!(:ingredient2) { Ingredient.create!(name: 'Tomato', calories: 50, dish: dish) }

  let!(:dish_ingredient1) { DishIngredient.create!(dish: dish, ingredient: ingredient1) }
  let!(:dish_ingredient2) { DishIngredient.create!(dish: dish, ingredient: ingredient2) }
  it 'has chefs name' do
    visit chef_path(chef.id)

    expect(page).to have_content('Remy')
  end

  it 'links to chefs ingredients index page' do
    visit chef_path(chef.id)

    expect(page).to have_link('Ingredients')
    click_link 'Ingredients'
    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
  end
end
