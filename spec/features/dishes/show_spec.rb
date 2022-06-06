require 'rails_helper'

RSpec.describe 'Dishes Show Page' do
  let!(:chef) { Chef.create!(name: 'Remy') }
  let!(:dish) { Dish.create!(name: 'Salad', description: 'Green and leafy!') }
  let!(:ingredient1) { dish.ingredients.create!(name: 'Kale', calories: 100) }
  let!(:ingredient2) { dish.ingredients.create!(name: 'Tomato', calories: 50) }
  let!(:dish_ingredient1) { DishIngredient.create!(dish: dish, ingredient: ingredient1) }
  let!(:dish_ingredient2) { DishIngredient.create!(dish: dish, ingredient: ingredient2) }
  xit 'has name and description' do
    visit dishes_path(dish.id)

    expect(page).to have_content('Salad')
    expect(page).to have_content('Green and leafy!')
  end

  xit 'lists ingredients' do
    visit dishes_path(dish.id)

    expect(page).to have_content('Kale')
    expect(page).to have_content('Tomato')
  end

  xit 'has chefs name' do
    visit dishes_path(dish.id)

    expect(page).to have_content('Remy')
  end
end
