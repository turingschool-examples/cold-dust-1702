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

    @salad = @jimbob.dishes.create!(name: "Dinner Salad", description: "A lighter dinner option, with a lovely floral dressing")
    @lettuce = Ingredient.create!(name: "Romaine Lettuce" , calories: 70)
    @vinaigrette = Ingredient.create!(name: "Light Floral Vinaigrette" , calories: 90)
    @croutons = Ingredient.create!(name: "Garlic Butter Croutons" , calories: 150)
    dish_ingredient4 = @salad.dish_ingredients.create!(ingredient_id: @lettuce.id)
    dish_ingredient5 = @salad.dish_ingredients.create!(ingredient_id: @vinaigrette.id)
    dish_ingredient6 = @salad.dish_ingredients.create!(ingredient_id: @croutons.id)
  end

  it 'has a dishes name and description on the page' do
    visit "/dishes/#{@spaghetti.id}"

    expect(page).to have_content(@spaghetti.name)
    expect(page).to have_content(@spaghetti.description)
    expect(page).to_not have_content(@salad.name)
    expect(page).to_not have_content(@salad.description)
  end

  it 'has all ingredients listed' do
    visit "/dishes/#{@spaghetti.id}"

    expect(page).to have_content(@noodle.name)
    expect(page).to have_content(@sauce.name)
    expect(page).to have_content(@cheese.name)
    expect(page).to_not have_content(@lettuce.name)
  end

  it "has the chef's name on the show page" do
    visit "/dishes/#{@spaghetti.id}"

    expect(page).to have_content(@jimbob.name)
  end

  it 'has total calorie count listed' do
    visit "/dishes/#{@spaghetti.id}"

    expect(page).to have_content(850)
    expect(page).to have_content("Total calories: 850")
    expect(page).to_not have_content(310)
    expect(page).to_not have_content("Total calories: 310")
  end
end
