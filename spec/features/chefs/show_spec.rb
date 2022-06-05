require 'rails_helper'

RSpec.describe Chef, type: :feature do
  it 'should show all chef info, link to ingredients that takes to chefs ingredients page' do
    chef1 = Chef.create!(name: 'Bryce Wein')
    dish1 = Dish.create!(name: 'Pasta', description: 'Spicy meatballs with garlic sauce', chef_id: chef1.id)
    ingredient1 = Ingredient.create!(name: 'Sausage', calories: 100)
    ingredient2 = Ingredient.create!(name: 'Penne Pasta', calories: 200)
    ingredient3 = Ingredient.create!(name: 'Red Garlic Sauce', calories: 25)
    dish_ingredient1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient1.id)
    dish_ingredient2 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient2.id)
    dish_ingredient3 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient3.id)
    dish2 = Dish.create!(name: 'Crab Salas', description: 'Light salad with crab meat', chef_id: chef1.id)
    ingredient4 = Ingredient.create!(name: 'Crab', calories: 15)
    ingredient5 = Ingredient.create!(name: 'Lettuce', calories: 4)
    ingredient6 = Ingredient.create!(name: 'Ranch Dressing', calories: 500)
    dish_ingredient4 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient4.id)
    dish_ingredient5 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient5.id)
    dish_ingredient6 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient6.id)
    dish_ingredient7 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient2.id)

    visit chef_path(chef1)

    within '#info' do
      expect(page).to have_content(chef1.name)
    end

    within '#ingredients' do
      expect(page).to have_link('Ingredients List')
      click_link('Ingredients List')
    end

    expect(current_path).to eq(chef_ingredients_path(chef1))

    within '#ingredients' do
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name).once
      expect(page).to have_content(ingredient3.name)
      expect(page).to have_content(ingredient4.name)
      expect(page).to have_content(ingredient5.name)
      expect(page).to have_content(ingredient6.name)
    end
  end

  it 'should show the 3 most popular ingredients used' do
    chef1 = Chef.create!(name: 'Bryce Wein')
    dish1 = Dish.create!(name: 'Pasta', description: 'Spicy meatballs with garlic sauce', chef_id: chef1.id)
    ingredient1 = Ingredient.create!(name: 'Sausage', calories: 100)
    ingredient2 = Ingredient.create!(name: 'Penne Pasta', calories: 200)
    ingredient3 = Ingredient.create!(name: 'Red Garlic Sauce', calories: 25)
    dish_ingredient1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient1.id)
    dish_ingredient2 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient2.id)
    dish_ingredient3 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient3.id)
    dish2 = Dish.create!(name: 'Crab Salas', description: 'Light salad with crab meat', chef_id: chef1.id)
    ingredient4 = Ingredient.create!(name: 'Crab', calories: 15)
    ingredient5 = Ingredient.create!(name: 'Lettuce', calories: 4)
    ingredient6 = Ingredient.create!(name: 'Ranch Dressing', calories: 500)
    dish_ingredient4 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient2.id)
    dish_ingredient5 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient5.id)
    dish_ingredient6 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient6.id)
    dish_ingredient7 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient2.id)
    dish3 = Dish.create!(name: 'Mayo Soup', description: 'A fun suprise!', chef_id: chef1.id)
    dish_ingredient4 = DishIngredient.create(dish_id: dish3.id, ingredient_id: ingredient3.id)
    dish_ingredient5 = DishIngredient.create(dish_id: dish3.id, ingredient_id: ingredient3.id)
    dish_ingredient6 = DishIngredient.create(dish_id: dish3.id, ingredient_id: ingredient1.id)
    dish_ingredient7 = DishIngredient.create(dish_id: dish3.id, ingredient_id: ingredient2.id)

    visit chef_path(chef1)

    within '#most_popular' do
      expect(ingredient2.name).to appear_before(ingredient3.name)
      expect(ingredient3.name).to appear_before(ingredient1.name)
    end
  end
end
