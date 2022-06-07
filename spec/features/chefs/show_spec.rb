require 'rails_helper'

RSpec.describe 'Chef Show Page', type: :feature do
  before(:each) do
    @jimbob = Chef.create!(name: "Jimbob Dudeguy")
    @pepsi = Chef.create!(name: "Ivanna Pepsi")
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

  it 'has the name of the chef' do
    visit "/chefs/#{@jimbob.id}"

    expect(page).to have_content(@jimbob.name)
    expect(page).to_not have_content(@pepsi.name)
  end

  it 'has a link to a chefs ingredient index page' do
    visit "/chefs/#{@jimbob.id}"

    expect(page).to have_link("Jimbob Dudeguy's Ingredients")
  end

  it 'has a working link to the chefs ingredients page' do
    visit "/chefs/#{@jimbob.id}"

    click_link("Jimbob Dudeguy's Ingredients")

    expect(page).to have_current_path("/chefs/#{@jimbob.id}/ingredients")
  end
end
