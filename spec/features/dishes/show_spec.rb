require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before :each do
    @chef1 = Chef.create!(name: "Boyardi")
    @chef2 = Chef.create!(name: "Mama Disalvo")
    @dish1 = @chef1.dishes.create!(name: "Spaghetti", description: "saucy boi")
    @dish2 = @chef1.dishes.create!(name: "Pizza", description: "Pepperoni")
    @noodle = Ingredient.create!(name: "Noodles", calories: "300")
    @sauce = Ingredient.create!(name: "Tomato Sauce", calories: "100")
    @bread = Ingredient.create!(name: "Bread", calories: "1000")
    @cheese = Ingredient.create!(name: "Cheese", calories: "250")
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @noodle.id)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @sauce.id)
    DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @bread.id)
    DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @cheese.id)
  end

  it "shows dish attributes, ingredients & chef name" do
    visit "/dishes/#{@dish1.id}"
    expect(page).to have_content("Spaghetti")
    expect(page).to have_content("Description: saucy boi")
    expect(page).to have_content("Noodles")
    expect(page).to have_content("Tomato Sauce")
    expect(page).to have_content("Chef: Boyardi")

    expect(page).to_not have_content("Mama Disalvo")
    expect(page).to_not have_content(@bread.name)
  end

  it "shows total calories for a dish" do
    visit "/dishes/#{@dish1.id}"
    expect(page).to have_content(@dish1.total_calories)

    expect(page).to_not have_content(@dish2.total_calories)
  end

end
