require 'rails_helper'

RSpec.describe 'chef show page' do
  it 'displays the chef name and a link to see all ingredients used by that chef' do
    chef = Chef.create!(name: 'Alfonso')
    chef2 = Chef.create!(name: 'Evil Alfonso')
    dish = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
    lettuce = Ingredient.create!(name: 'lettuce', calories: 0)
    tears = Ingredient.create!(name: 'tears', calories: 12)
    gluten_free_croutons = Ingredient.create!(name: 'Gluten-Free Croutons', calories: 129)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: lettuce.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: tears.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: gluten_free_croutons.id)

    visit "/chefs/#{chef.id}"

    expect(page).to have_content('Alfonso')

    expect(page).to_not have_content('Evil Alfonso')

    expect(page).to have_link('Favorite Ingredients')
  end

  it 'has a link that takes you to an index with all of the ingredients the chef uses' do
    chef = Chef.create!(name: 'Alfonso')
    dish = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
    lettuce = Ingredient.create!(name: 'lettuce', calories: 0)
    tears = Ingredient.create!(name: 'tears', calories: 12)
    gluten_free_croutons = Ingredient.create!(name: 'Gluten-Free Croutons', calories: 129)
    pepperoni = Ingredient.create!(name: 'Pepperoni', calories: 129)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: lettuce.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: tears.id)
    DishIngredient.create!(dish_id: dish.id, ingredient_id: gluten_free_croutons.id)

    visit "/chefs/#{chef.id}"

    click_link('Favorite Ingredients')

    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")

    expect(page).to have_content('lettuce')

    expect(page).to have_content('tears')

    expect(page).to have_content('Gluten-Free Croutons')

    expect(page).to_not have_content('Pepperoni')
  end
end
