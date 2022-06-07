require 'rails_helper'

RSpec.describe "Dishes show page" do
  before :each do
    @chef1 = Chef.create!(name: "Bob")
    @chef2 = Chef.create!(name: "Joe")

    @dish1 = Dish.create!(name: 'soup', description: 'soupy', chef_id: @chef1.id)
    @dish2 = Dish.create!(name: 'sandwich', description: 'cheesy', chef_id: @chef2.id)

    @ing1 = Ingredient.create!(name: "swiss cheese", calories: "100")
    @ing2 = Ingredient.create!(name: "pork", calories: "200")
    @ing3 = Ingredient.create!(name: "broth", calories: "300")
    @ing4 = Ingredient.create!(name: "beef", calories: "400")

    @di1.dish_ingredient.create!(dish_id: @dish_2.id, ingredient_id: @ing1.id)
    @di2.dish_ingredient.create!(dish_id: @dish_2.id, ingredient_id: @ing2.id)
    @di3.dish_ingredient.create!(dish_id: @dish_1.id, ingredient_id: @ing4.id)
    @di4.dish_ingredient.create!(dish_id: @dish_1.id, ingredient_id: @ing3.id)
  end

  it "shows dish name, description, ingredients, and chef" do
    visit dish_path(@dish2)

    expect(page).to have_content('ham and cheese')
    expect(page).to have_content('cheesy')
    expect(page).to have_content('pork')
    expect(page).to have_content('swiss cheese')
    expect(page).to have_content('Joe')
  end
end
