require 'rails_helper'

RSpec.describe 'dish show page' do
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

    @di1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @di2 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient2.id)
    @di3 = DishIngredient.create!(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
    @di4 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient4.id)
  end

  it "displays the dish attributes, ingredients, and chef" do
    visit "/dishes/#{@dish1.id}"

    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@dish1.chef.name)
  end


end
