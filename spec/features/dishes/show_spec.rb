require 'rails_helper'

RSpec.describe "Dishes show page" do
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

    visit dish_path(@dish2)
  end

  it "shows dish name, description, ingredients, and chef" do
    expect(page).to have_content('ham and cheese')
    expect(page).to have_content('cheesy')
    expect(page).to have_content('pork')
    expect(page).to have_content('swiss cheese')
    expect(page).to have_content('Joe')

    expect(page).to_not have_content('soup')
    expect(page).to_not have_content('soupy')
    expect(page).to_not have_content('broth')
    expect(page).to_not have_content('beef')
    expect(page).to_not have_content('Bob')
  end

  it "should show total calorie count" do
    expect(page).to have_content("Total Calories: 300")
  end
end
