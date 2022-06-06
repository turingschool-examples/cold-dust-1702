require 'rails_helper'

RSpec.describe 'Chef Ingredients Index Page' do
  let!(:chef) { Chef.create!(name: 'Remy') }

  let!(:dish) { chef.dishes.create!(name: 'Salad', description: 'Green and leafy!') }
  let!(:dish2) { chef.dishes.create!(name: 'Soup', description: 'Soup of the day!') }

  let!(:ingredient1) { Ingredient.create!(name: 'Kale', calories: 100) }
  let!(:ingredient2) { Ingredient.create!(name: 'Tomato', calories: 50) }
  let!(:ingredient3) { Ingredient.create!(name: 'Mushroom', calories: 150) }

  let!(:dish_ingredient1) { DishIngredient.create!(dish: dish, ingredient: ingredient1) }
  let!(:dish_ingredient2) { DishIngredient.create!(dish: dish, ingredient: ingredient2) }
  let!(:dish_ingredient3) { DishIngredient.create!(dish: dish2, ingredient: ingredient3) }
  let!(:dish_ingredient4) { DishIngredient.create!(dish: dish2, ingredient: ingredient2) }
  it 'lists ingredients this chef uses' do
    visit chef_ingredients_path(chef.id)

    expect(page).to have_content('Kale')
    expect(page).to have_content('Tomato')
    expect(page).to have_content('Mushroom')
  end
end
