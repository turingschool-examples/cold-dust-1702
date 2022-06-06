require 'rails_helper'

RSpec.describe 'dish show page' do
  it 'display the dish name, description, ingredients, and chef name' do
    chef = Chef.create!(name: 'Alfonso')
    dish = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
    lettuce = Ingredient.create!(name: 'lettuce', calories: 0)
    tears = Ingredient.create!(name: 'tears', calories: 12)
    gluten_free_croutons = Ingredient.create!(name: 'Gluten-Free Croutons', calories: 129)
    pepperoni = Ingredient.create!(name: 'Pepperoni', calories: 129)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: lettuce.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: tears.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: gluten_free_croutons.id)

    visit "/dishes/#{dish.id}"
    expect(page).to have_content('Sorry Salad')

    expect(page).to have_content('I am so sorry I made this.')

    expect(page).to have_content('lettuce')

    expect(page).to have_content('tears')

    expect(page).to have_content('Gluten-Free Croutons')

    expect(page).to_not have_content('Pepperoni')

    expect(page).to have_content('Alfonso')
  end

  it 'displays the dish entire calories' do
    chef = Chef.create!(name: 'Alfonso')
    dish = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
    lettuce = Ingredient.create!(name: 'lettuce', calories: 0)
    tears = Ingredient.create!(name: 'tears', calories: 12)
    gluten_free_croutons = Ingredient.create!(name: 'Gluten-Free Croutons', calories: 129)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: lettuce.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: tears.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: gluten_free_croutons.id)

    visit "/dishes/#{dish.id}"
    expect(page).to have_content('Calories: 141')
  end
end
