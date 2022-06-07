require 'rails_helper'

RSpec.describe 'Chef Show' do
  it 'displays the chef name and link to their ingredients' do
    chef_1 = Chef.create!(name: "Lee Kwan Yew")
    dish_1 = chef_1.dishes.create!(name:"Chicken Rice", description: "This is a local Singaporean dish")
    dish_2 = chef_1.dishes.create!(name:"Lamb Rice", description: "This is not a local Singaporean dish")
    dish_3 = chef_1.dishes.create!(name:"Chicken Noodles", description: "This was a local Singaporean dish")
    dish_4 = chef_1.dishes.create!(name:"Lamb Couscous", description: "This was once a local Singaporean dish")
    ingredient_1 = Ingredient.create!(name: "chicken", calories: 1000)
    ingredient_2 = Ingredient.create!(name: "rice", calories: 600)
    ingredient_3 = Ingredient.create!(name: "lamb", calories: 700)
    ingredient_4 = Ingredient.create!(name: "noodles", calories: 1200)
    ingredient_5 = Ingredient.create!(name: "couscous", calories: 1200)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)
    DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_4.id)
    DishIngredient.create!(dish_id: dish_4.id, ingredient_id: ingredient_3.id)
    DishIngredient.create!(dish_id: dish_4.id, ingredient_id: ingredient_5.id)

    visit chef_path(chef_1)

    expect(page).to have_content("Chef: Lee Kwan Yew")
    expect(page).to have_link("Chef's Ingredients")

    click_link("Chef's Ingredients")
    expect(current_path).to eq(chef_ingredients_path(chef_1))
  end

  it 'displays three most popular ingredients' do
    chef_1 = Chef.create!(name: "Lee Kwan Yew")
    dish_1 = chef_1.dishes.create!(name:"Chicken Rice", description: "This is a local Singaporean dish")
    dish_2 = chef_1.dishes.create!(name:"Lamb Rice", description: "This is not a local Singaporean dish")
    dish_3 = chef_1.dishes.create!(name:"Chicken Noodles", description: "This was a local Singaporean dish")
    dish_4 = chef_1.dishes.create!(name:"Lamb Couscous", description: "This was once a local Singaporean dish")
    ingredient_1 = Ingredient.create!(name: "chicken", calories: 1000)
    ingredient_2 = Ingredient.create!(name: "rice", calories: 600)
    ingredient_3 = Ingredient.create!(name: "lamb", calories: 700)
    ingredient_4 = Ingredient.create!(name: "noodles", calories: 1200)
    ingredient_5 = Ingredient.create!(name: "couscous", calories: 1200)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)
    DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_4.id)
    DishIngredient.create!(dish_id: dish_4.id, ingredient_id: ingredient_3.id)
    DishIngredient.create!(dish_id: dish_4.id, ingredient_id: ingredient_5.id)

    visit chef_path(chef_1)

    within '#popular-ingredients' do
      expect(page).to have_content("chicken")
      expect(page).to have_content("rice")
      expect(page).to have_content("lamb")
    end
  end
end
