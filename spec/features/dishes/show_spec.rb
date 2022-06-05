require 'rails_helper'

RSpec.describe Dish, type: :feature do
  it 'should display the name/dscription/chefs name, and a list of ingredients' do
    chef1 = Chef.create!(name: 'Bryce Wein')
    dish1 = Dish.create!(name: 'Pasta', description: 'Spicy meatballs with garlic sauce', chef_id: chef1.id)
    ingredient1 = Ingredient.create!(name: 'Sausage', calories: 100)
    ingredient2 = Ingredient.create!(name: 'Penne Pasta', calories: 200)
    ingredient3 = Ingredient.create!(name: 'Red Garlic Sauce', calories: 25)
    dish_ingredient1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient1.id)
    dish_ingredient2 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient2.id)
    dish_ingredient3 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient3.id)

    visit dish_path(dish1)
    within '#name' do
      expect(page).to have_content(dish1.name)
    end
    within '#description' do
      expect(page).to have_content(dish1.description)
    end
    within '#chef' do
      expect(page).to have_content(chef1.name)
    end
    within '#ingredients' do
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
    end
  end
end
