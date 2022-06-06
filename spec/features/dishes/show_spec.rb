require 'rails_helper'

RSpec.describe 'Dishes Show Page' do
  let!(:chef) { Chef.create!(name: 'Remy') }

  let!(:dish) { chef.dishes.create!(name: 'Salad', description: 'Green and leafy!') }

  let!(:ingredient1) { Ingredient.create!(name: 'Kale', calories: 100, dish: dish) }
  let!(:ingredient2) { Ingredient.create!(name: 'Tomato', calories: 50, dish: dish) }

  let!(:dish_ingredient1) { DishIngredient.create!(dish: dish, ingredient: ingredient1) }
  let!(:dish_ingredient2) { DishIngredient.create!(dish: dish, ingredient: ingredient2) }

  it 'has name and description' do
    visit dish_path(dish.id)

    expect(page).to have_content('Salad')
    expect(page).to have_content('Green and leafy!')
  end

  it 'lists ingredients' do
    visit dish_path(dish.id)

    expect(page).to have_content('Kale')
    expect(page).to have_content('Tomato')
  end

  it 'has chefs name' do
    visit dish_path(dish.id)

    expect(page).to have_content('Remy')
  end
end
