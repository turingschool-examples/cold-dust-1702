require 'rails_helper'

RSpec.describe 'Merchant Show Dash', type: :feature do
  before(:each) do
    @jimbob = Chef.create!(name: "Jimbob Dudeguy")
    @spaghetti = @jimbob.dishes.create!(name: "Spaghetti" , description: "Wholesome ol' carbs, tomato, and cheese")
    @noodle = Ingredient.create!(name: "Pasta", calories: 500)
    @sauce = Ingredient.create!(name: "Tomato Sauce", calories: 85)
    @cheese = Ingredient.create!(name: "Mozzarella", calories: 265)

    dish_ingredient1 = @spaghetti.dish_ingredients.create!(ingredient_id: @noodle.id)
    dish_ingredient2 = @spaghetti.dish_ingredients.create!(ingredient_id: @sauce.id)
    dish_ingredient3 = @spaghetti.dish_ingredients.create!(ingredient_id: @cheese.id)
  end

  it 'has a dishes name and description on the page' do
    visit "/dishes/#{@spaghetti.id}"

    expect(page).to have_content(@spaghetti.name)
    expect(page).to have_content(@spaghetti.description)
  end

  it 'has all ingredients listed' do
    visit "/dishes/#{@spaghetti.id}"

    expect(page).to have_content(@noodle.name)
    expect(page).to have_content(@sauce.name)
    expect(page).to have_content(@cheese.name)
  end
end
