require 'rails_helper'

RSpec.describe 'chef show page' do
  it 'displays the chef name and a link to see all ingredients used by that chef' do
    chef = Chef.create!(name: 'Alfonso')
    dish = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
    lettuce = Ingredient.create!(name: 'lettuce', calories: 0)
    tears = Ingredient.create!(name: 'tears', calories: 12)
    gluten_free_croutons = Ingredient.create!(name: 'Gluten-Free Croutons', calories: 129)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: lettuce.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: tears.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: gluten_free_croutons.id)

    visit "/chefs/#{chef.id}"
    expect(page).to have_content('Alfonso')

    expect(page).to have_link('Favorite Ingredients')
  end
end
