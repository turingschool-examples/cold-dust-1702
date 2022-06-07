require 'rails_helper'

RSpec.describe "chef's show page" do
  let!(:chef1) { Chef.create!(name: "Marion") }
  let!(:chef2) { Chef.create!(name: "Maangchi") }

  let!(:dish1) { chef1.dishes.create!(name: 'Fancy Mac', description: "Hands down the best mac you've ever had!") }
  let!(:dish2) { chef2.dishes.create!(name: 'Fancy Ramen', description: "Add a ramen egg to it!") }
  let!(:dish3) { chef2.dishes.create!(name: 'Korean Seaweed Soup', description: "Good health forever!") }
  let!(:dish4) { chef2.dishes.create!(name: 'Tofu Noodle', description: "Noodles every day!") }

  let!(:ingredient1) { Ingredient.create!(name: 'Curly Noodles', calories: 150) }
  let!(:ingredient2) { Ingredient.create!(name: 'Cheese', calories: 200) }
  let!(:ingredient3) { Ingredient.create!(name: 'Tofu', calories: 100) }
  let!(:ingredient4) { Ingredient.create!(name: 'Seaweed', calories: 50) }

  let!(:dish_ingredient1) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id) }
  let!(:dish_ingredient2) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id) }
  let!(:dish_ingredient3) { DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingredient3.id) }
  let!(:dish_ingredient4) { DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingredient4.id) }
  let!(:dish_ingredient5) { DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingredient1.id) }
  let!(:dish_ingredient6) { DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient1.id) }
  let!(:dish_ingredient7) { DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient5.id) }
  let!(:dish_ingredient7) { DishIngredient.create!(dish_id: dish4.id, ingredient_id: ingredient3.id) }
  let!(:dish_ingredient7) { DishIngredient.create!(dish_id: dish4.id, ingredient_id: ingredient1.id) }

  before do
    visit chef_path(chef2)
  end

  it "displays the chef's name" do
    expect(page).to have_content('Maangchi')
  end

  it "can click a link to view a list of all ingredients that this chef uses in their dishes" do
    click_link "See Ingredient List"

    expect(current_path).to eq("/chefs/#{chef2.id}/ingredients")
    expect(page).to have_content('Tofu')
    expect(page).to have_content('Seaweed')
    expect(page).to have_content('Curly Noodles')
    expect(page).to_not have_content('Cheese')
  end

# As a visitor
# When I visit a chef's show page
# I see the three most popular ingredients that the chef uses in their dishes
# (Popularity is based off of how many dishes use that ingredient)

  it "displays the three most popular ingredients that the chef uses in their dishes" do
    within 'most_popular_ingredients' do
      expect('Curly Noodles').to appear_before('Tofu')
      expect('Tofu').to appear_before('Seaweed')
    end
  end
end
