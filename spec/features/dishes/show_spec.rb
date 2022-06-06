require 'rails_helper'

describe 'dishes show page' do
  before do
    chef = Chef.create!(name: "Rob")

    dish1 = chef.dishes.create!(name: "Pancakes", description: "Stack of 3 fluffy pancakes")
    dish2 = chef.dishes.create!(name: "Omelette", description: "Served with home fries")

    milk = Ingredient.create!(name: "milk", calories: 90)
    flour = Ingredient.create!(name: "flour", calories: 60)
    eggs = Ingredient.create!(name: "eggs", calories: 80)
    potatoes = Ingredient.create!(name: "potatoes", calories: 100)

    DishIngredient.create!(dish: dish1, ingredient: milk)
    DishIngredient.create!(dish: dish1, ingredient: flour)
    DishIngredient.create!(dish: dish1, ingredient: eggs)
    DishIngredient.create!(dish: dish2, ingredient: potatoes)
    visit dish_path(dish1)
  end

  it "displays the dish's name, description, ingredients and name of the chef" do
    expect(page).to have_content("Pancakes")
    expect(page).to_not have_content("Omelette")

    expect(page).to have_content("Rob")
    expect(page).to have_content("Stack of 3 fluffy pancakes")

    expect(page).to have_content("milk")
    expect(page).to have_content("flour")
    expect(page).to_not have_content("potatoes")
  end

  it "displays the total calories in the dish" do

    within '.dish-stats' do
      expect(page).to have_content("230 Calories")
    end

  end
end
