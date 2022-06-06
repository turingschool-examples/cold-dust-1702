require 'rails_helper'

RSpec.describe "Chef Ingredients Index Page" do
  before :each do
    @chef1 = Chef.create!(name: "Boyardi")
    @chef2 = Chef.create!(name: "Mama Disalvo")
    @dish1 = @chef1.dishes.create!(name: "Spaghetti", description: "saucy boi")
    @dish2 = @chef2.dishes.create!(name: "Pizza", description: "Pepperoni")
    @noodle = Ingredient.create!(name: "Noodles", calories: "300")
    @sauce = Ingredient.create!(name: "Tomato Sauce", calories: "100")
    @bread = Ingredient.create!(name: "Bread", calories: "1000")
    @cheese = Ingredient.create!(name: "Cheese", calories: "250")
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @noodle.id)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @sauce.id)
    DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @bread.id)
    DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @cheese.id)
  end

  it "shows all ingredients a chef has used" do
    visit "/chefs/#{@chef1.id}/ingredients"
    expect(page).to have_content("Ingredients used by this Chef:")
    expect(page).to have_content("Noodles")
    expect(page).to have_content("Tomato Sauce")

    expect(page).to_not have_content("Bread")
    expect(page).to_not have_content("Cheese")
  end

end
