require 'rails_helper'

RSpec.describe 'Chefs show page' do
  before :each do
    @chef1 = Chef.create!(name: "Bob")
    @chef2 = Chef.create!(name: "Joe")

    @dish1 = Dish.create!(name: 'soup', description: 'soupy', chef_id: @chef1.id)
    @dish2 = Dish.create!(name: 'ham and cheese', description: 'cheesy', chef_id: @chef2.id)

    @ing1 = Ingredient.create!(name: "swiss cheese", calories: "100")
    @ing2 = Ingredient.create!(name: "pork", calories: "200")
    @ing3 = Ingredient.create!(name: "broth", calories: "300")
    @ing4 = Ingredient.create!(name: "beef", calories: "400")

    @dish2.dish_ingredients.create!(ingredient_id: @ing1.id)
    @dish2.dish_ingredients.create!(ingredient_id: @ing2.id)
    @dish1.dish_ingredients.create!(ingredient_id: @ing4.id)
    @dish1.dish_ingredients.create!(ingredient_id: @ing3.id)

    visit chef_path(@chef1)
  end

  it "should show chef name and link to ingredients" do
    expect(page).to have_content("Bob")
    expect(page).to have_link("Ingredients")
    click_link "Ingredients"
    expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
    expect(page).to have_content("broth")
    expect(page).to have_content("beef")
    expect(page).to_not have_content("swiss cheese")
    expect(page).to_not have_content("pork")
  end

  it "has a list of the three most popular ingredients used by the chef" do
    dish3 = Dish.create!(name: 'steak', description: 'bloody', chef_id: @chef1.id)
    dish4 = Dish.create!(name: 'steak sandwich', description: 'bloody sandwich', chef_id: @chef1.id)

    ing5 = Ingredient.create!(name: "potatoes", calories: "100")
    ing6 = Ingredient.create!(name: "salt", calories: "100")
    ing7 = Ingredient.create!(name: "pepper", calories: "300")
    ing8 = Ingredient.create!(name: "bread", calories: "400")

    dish3.dish_ingredients.create!(ingredient_id: ing5.id)
    dish3.dish_ingredients.create!(ingredient_id: ing6.id)
    dish3.dish_ingredients.create!(ingredient_id: ing7.id)
    dish3.dish_ingredients.create!(ingredient_id: ing8.id)
    @dish1.dish_ingredients.create!(ingredient_id: ing8.id)
    dish4.dish_ingredients.create!(ingredient_id: ing8.id)
    dish4.dish_ingredients.create!(ingredient_id: ing6.id)
    dish4.dish_ingredients.create!(ingredient_id: @ing4.id)

    within "#top_3" do
      expect(page).to have_content("beef")
      expect(page).to have_content("bread")
      expect(page).to have_content("salt")
    end
  end
end
