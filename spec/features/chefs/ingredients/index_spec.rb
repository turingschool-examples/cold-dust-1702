require 'rails_helper'

RSpec.describe 'Chef Ingredient Index Page', type: :feature do
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
    dish_ingredient7 = @salad.dish_ingredients.create!(ingredient_id: @cheese.id)
  end
  it 'has a list of all ingredients the chef uses, and does not repeat ingredients' do
    visit "/chefs/#{@jimbob.id}/ingredients"
    within "#ingredientsList" do
      expect(page.all('.ingredient')[0]).to have_content("Garlic Butter Croutons")
      expect(page.all('.ingredient')[1]).to have_content("Light Floral Vinaigrette")
      expect(page.all('.ingredient')[2]).to have_content("Mozzarella")
      expect(page.all('.ingredient')[3]).to have_content("Pasta")
      expect(page.all('.ingredient')[4]).to have_content("Romaine Lettuce")
      expect(page.all('.ingredient')[5]).to have_content("Tomato Sauce")
      expect(page.all('.ingredient')[6]).to eq(nil)
    end
  end
end
