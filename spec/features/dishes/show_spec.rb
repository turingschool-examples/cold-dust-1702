require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before :each do
    @chef1 = Chef.create!(name: "Boyardi")
    @chef2 = Chef.create!(name: "Mama Disalvo")
    @dish1 = @chef1.dishes.create!(name: "Spaghetti", description: "saucy boi")
    @noodle = Ingredient.create!(name: "Noodles", calories: "300")
    @sauce = Ingredient.create!(name: "Tomato Sauce", calories: "100")
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @noodle.id)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @sauce.id)
  end

  it "shows dish attributes, ingredients & chef name" do
    visit "/dishes/#{@dish1.id}"
    save_and_open_page
    expect(page).to have_content("Spaghetti")
    expect(page).to have_content("Description: saucy boi")
    expect(page).to have_content("Noodles")
    expect(page).to have_content("Tomato Sauce")
    expect(page).to have_content("Chef: Boyardi")

    expect(page).to_not have_content("Mama Disalvo")
  end


end
