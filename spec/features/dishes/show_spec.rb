require 'rails_helper'

RSpec.describe "dish's show page" do
  let!(:chef1) { Chef.create!(name: "Marion") }
  let!(:chef2) { Chef.create!(name: "Maangchi") }

  let!(:dish1) { chef1.dishes.create!(name: 'Fancy Mac', description: "Hands down the best mac you've ever had!") }
  let!(:dish2) { chef2.dishes.create!(name: 'Fancy Ramen', description: "Add a ramen egg to it!") }
  let!(:dish3) { chef2.dishes.create!(name: 'Korean Seaweed Soup', description: "Good health forever!") }

  let!(:ingredient1) { Ingredient.create!(name: 'Curly Noodles', calories: 150) }
  let!(:ingredient2) { Ingredient.create!(name: 'Cheese', calories: 200) }
  let!(:ingredient3) { Ingredient.create!(name: 'Tofu', calories: 100) }

  let!(:dish_ingredient1) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id) }
  let!(:dish_ingredient2) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id) }
  let!(:dish_ingredient3) { DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient3.id) }

  before do
    visit dish_path(dish1)
  end

  it "displays the dish's name, description, chef's name, and lists all ingredients for that dish" do
    expect(page).to have_content('Dish: Fancy Mac')
    expect(page).to have_content("Description: Hands down the best mac you've ever had!")
    expect(page).to have_content("Chef: Marion")

    expect(page).to_not have_content("Fancy Ramen")
    expect(page).to_not have_content("Add a ramen egg to it!")
    expect(page).to_not have_content("Maanchi")

    within '.ingredients' do
      expect(page).to have_content('Curly Noodles')
      expect(page).to have_content('Cheese')
      expect(page).to_not have_content('Tofu')
    end
  end

  it "lists the total calorie count for the dish" do
    expect(page).to have_content(350)
  end
end
