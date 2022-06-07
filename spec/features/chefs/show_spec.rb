require 'rails_helper'

RSpec.describe 'chef show page' do
  before(:each) do
    @chef1 = Chef.create!(name: 'Cory')
    @chef2 = Chef.create!(name: 'Kyle')

    @dish1 = @chef1.dishes.create!(name: "Pizza", description: 'I love it.')
    @dish2 = @chef1.dishes.create!(name: "Pasta", description: 'I kinda love it.')
    @dish3 = @chef2.dishes.create!(name: "Collard Greens", description: 'I hate it.')
    @dish4 = @chef2.dishes.create!(name: "Chives", description: 'I kinda hate it.')

    @ingredient1 = Ingredient.create!(name: 'Pepperoni', calories: 200)
    @ingredient2 = Ingredient.create!(name: 'Cheese', calories: 20)
    @ingredient3 = Ingredient.create!(name: 'Leafy Greens', calories: 10)
    @ingredient4 = Ingredient.create!(name: 'Green Onion', calories: 100)
    @ingredient5 = Ingredient.create!(name: 'Extra Pepperoni', calories: 400)


    @di1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @di2 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient2.id)
    @di3 = DishIngredient.create!(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
    @di4 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient4.id)
    @di5 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient5.id)
  end

  it "shows the chefs name and lists all the ingredients of their dishes" do
    visit "/chefs/#{@chef1.id}"

    expect(page).to have_content(@chef1.name)

    click_link('All Ingredients Used by this Chef')

    expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient5.name)
    expect(page).to_not have_content(@ingredient3.name)
    expect(page).to_not have_content(@ingredient4.name)
  end
end
