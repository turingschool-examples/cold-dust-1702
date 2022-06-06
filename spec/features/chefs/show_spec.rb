require "rails_helper"

RSpec.describe "Chef Show Page" do
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

  it "shows chef name & link to ingredients used" do
    visit "/chefs/#{@chef1.id}"
    expect(page).to have_content("Chef Name: Boyardi")
    click_on "See All Ingredients used by this Chef"
    expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
  end
end
