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

  it 'lists the three most used ingredients by that chef' do
    chef = Chef.create!(name: 'Alfonso')
    dish1 = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
    dish2 = chef.dishes.create!(name: 'Poorly Made Pizza', description: 'You said, "No cheese." right?')
    dish3 = chef.dishes.create!(name: 'From the Dumpster, With Love', description: 'Waste not, want not.')
    dish = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
    lettuce = Ingredient.create!(name: 'lettuce', calories: 0)
    tears = Ingredient.create!(name: 'tears', calories: 12)
    gluten_free_croutons = Ingredient.create!(name: 'Gluten-Free Croutons', calories: 129)
    pepperoni = Ingredient.create!(name: 'Pepperoni', calories: 129)
    volkswagen = Ingredient.create!(name: 'VW Bug', calories: 12_129)
    yesterdays_special = Ingredient.create!(name: "Today's Special", calories: 1129)
    pineapple = Ingredient.create!(name: 'Pineapple', calories: 129)

    # =========== DISH1 Ingredients ===========
    DishIngredient.create!(dish_id: dish1.id, ingredient_id: lettuce.id)
    DishIngredient.create!(dish_id: dish1.id, ingredient_id: tears.id)
    DishIngredient.create!(dish_id: dish1.id, ingredient_id: gluten_free_croutons.id)

    # =========== DISH2 Ingredients ===========
    DishIngredient.create!(dish_id: dish2.id, ingredient_id: lettuce.id)
    DishIngredient.create!(dish_id: dish2.id, ingredient_id: tears.id)
    DishIngredient.create!(dish_id: dish2.id, ingredient_id: pineapple.id)
    DishIngredient.create!(dish_id: dish2.id, ingredient_id: yesterdays_special.id)

    # =========== DISH3 Ingredients ===========
    DishIngredient.create!(dish_id: dish3.id, ingredient_id: lettuce.id)
    DishIngredient.create!(dish_id: dish3.id, ingredient_id: tears.id)
    DishIngredient.create!(dish_id: dish3.id, ingredient_id: volkswagen.id)
    DishIngredient.create!(dish_id: dish3.id, ingredient_id: pineapple.id)

    visit "/chefs/#{chef.id}"

    expect(page).to have_content('tears')

    expect(page).to have_content('lettuce')

    expect(page).to have_content('Pineapple')

    expect(page).to_not have_content('Pepperoni')

    expect(page).to_not have_content("Today's Special")

    expect(page).to_not have_content('VW Bug')
  end
end
