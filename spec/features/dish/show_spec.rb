require 'rails_helper' 

RSpec.describe 'dish show page', type: :feature do

  before :each do
    @chef = Chef.create!(name: "Thomas")

    @dish_1 = @chef.dishes.create!(name: "Chicken Enchiladas", description: "Spicy enchiladas covered in cheese")
    @dish_2 = @chef.dishes.create!(name: "Roasted Chicken Linguini", description: "Creamy pasta")
    @dish_3 = @chef.dishes.create!(name: "Baked Ziti", description: "Red sauce with italian sausage")
  
    @chicken = Ingredient.create!(name: "Chicken", calories: 400)
    @noodles = Ingredient.create!(name: "Noodles", calories: 200)
    @sausage = Ingredient.create!(name: "Sausage", calories: 500)
    @peppers = Ingredient.create!(name: "Bell Pepper", calories: 50)

    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @chicken.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @peppers.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @noodles.id)
    DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @sausage.id)
  end

  it "displays the dish's name, desription, list of ingredients, and chef's name" do
    visit "/dishes/#{@dish_1.id}"
    
    expect(page).to have_content("Chicken Enchiladas")
    expect(page).to have_content("Spicy enchiladas covered in cheese")
    expect(page).to have_content("Chicken")
    expect(page).to have_content("Bell Pepper")
    expect(page).to have_content("Chef: Thomas")
    expect(page).to_not have_content("Roasted Chicken Linguini")
    expect(page).to_not have_content("Baked Ziti")
    expect(page).to_not have_content("Creamy pasta")
    expect(page).to_not have_content("Red sauce with italian sausage")
    expect(page).to_not have_content("Noodles")
    expect(page).to_not have_content("Sausage")
  end

  it "displays total calorie count for the dish" do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content("Calories: 450")
  end

end