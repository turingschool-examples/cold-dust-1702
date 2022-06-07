require 'rails_helper'

RSpec.describe 'dish show' do
  it 'displays the dishs name and description' do
    chef_1 = Chef.create!(name: "Lee Kwan Yew")
    dish_1 = chef_1.dishes.create!(name:"Chicken Rice", description: "This is a local Singaporean dish")
    ingredient_1 = Ingredient.create!(name: "chicken", calories: 1000)
    ingredient_2 = Ingredient.create!(name: "rice", calories: 600)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)

    visit dish_path(dish_1)
  
    within '#name' do
      expect(page).to have_content("Dish: Chicken Rice")
    end

    within '#description' do
      expect(page).to have_content("Description: This is a local Singaporean dish")
    end

    within '#chefname' do
      expect(page).to have_content("Chef: Lee Kwan Yew")
    end

    within '#ingredients' do
      expect(page).to have_content("chicken")
      expect(page).to have_content("rice")
    end

    within '#calories' do
      expect(page).to have_content("Total Calories: 1600")
    end
  end
end
