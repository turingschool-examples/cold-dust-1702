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
end
