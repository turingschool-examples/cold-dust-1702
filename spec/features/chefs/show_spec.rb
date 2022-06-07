require 'rails_helper'

RSpec.describe 'chef show page', type: :feature do

  before :each do
    @chef_1 = Chef.create!(name: "Thomas")
    @chef_2 = Chef.create!(name: "Maya")

    @dish_1 = @chef_1.dishes.create!(name: "Chicken Enchiladas", description: "Spicy enchiladas covered in cheese")
    @dish_2 = @chef_1.dishes.create!(name: "Roasted Chicken Linguini", description: "Creamy pasta")
    @dish_3 = @chef_1.dishes.create!(name: "Baked Ziti", description: "Red sauce with italian sausage")
    @dish_4 = @chef_2.dishes.create!(name: "Shrimp pasta", description: "Rose sauce with sauteed shrimp")
    @dish_5 = @chef_1.dishes.create!(name: "Chicken Spaghetti", description: "Bell peppers and creamy chicken sauce")

    @chicken = Ingredient.create!(name: "Chicken", calories: 400)
    @noodles = Ingredient.create!(name: "Noodles", calories: 200)
    @sausage = Ingredient.create!(name: "Sausage", calories: 500)
    @peppers = Ingredient.create!(name: "Bell Pepper", calories: 50)
    @shrimp = Ingredient.create!(name: "Shrimp", calories: 200)

    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @chicken.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @peppers.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @noodles.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @chicken.id)
    DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @sausage.id)    
    DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @shrimp.id)    
    DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @noodles.id)   
    DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @noodles.id)   
    DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @chicken.id)   
    DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @peppers.id)   
  end

  it 'displays the name of that chef, link to all ingredients the chef has used, link goes to chefs ingredient index page' do
    visit "chefs/#{@chef_1.id}"

    expect(page).to have_content("Thomas")
    expect(page).to_not have_content("Maya")

    click_link("Chef's Ingredients")
    expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")
  end

  it 'displays the top 3 most popular ingredients' do
    visit "chefs/#{@chef_1.id}"

    expect(page).to have_content("Chicken")
    expect(page).to have_content("Noodles")
    expect(page).to have_content("Bell Pepper")
    expect(page).to_not have_content("Sausage")
    expect(page).to_not have_content("Shrimp")
  end

end