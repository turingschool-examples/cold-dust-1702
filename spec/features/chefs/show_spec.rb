require 'rails_helper'

RSpec.describe 'Chefs::Show' do
  before :each do
    @chef1 = Chef.create!(name: 'ol Stirl')

    @dish1 = Dish.create!(name: 'Hot dog', description: 'Big gourmet hot dog', chef_id: @chef1.id)
    @dish2 = Dish.create!(name: 'Rice n Beans', description: 'Rice that includes beans in it', chef_id: @chef1.id)

    @ingredient1 = Ingredient.create!(name: 'Mustard', calories: 5)
    @ingredient2 = Ingredient.create!(name: 'Bun', calories: 100)
    @ingredient3 = Ingredient.create!(name: 'Vegetarian hot dog', calories: 150)
    @ingredient4 = Ingredient.create!(name: 'Rice', calories: 50)
    @ingredient5 = Ingredient.create!(name: 'Black Beans', calories: 150)
    @ingredient6 = Ingredient.create!(name: 'Jalapenos', calories: 50)

    @dish_ingredient1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient2 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient3 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
    @dish_ingredient7 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient6.id)
    @dish_ingredient4 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
    @dish_ingredient5 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient5.id)
    @dish_ingredient6 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient6.id)
  end
  it 'shows the name of the chef' do
    visit chef_path(@chef1)

    expect(page).to have_content(@chef1.name)
  end

  it 'contains a link to chefs ingredient show page' do
    visit chef_path(@chef1)

    expect(page).to have_link("Chef's Ingredients")

    click_link "Chef's Ingredients"

    expect(current_path).to eq(chef_ingredients_path(@chef1))
  end
end
