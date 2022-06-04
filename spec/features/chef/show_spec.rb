require 'rails_helper'

RSpec.describe 'chef show page' do 
  let!(:chef_1) {Chef.create!(name: "Boyardee")}
  let!(:dish_1) {chef_1.dishes.create!(name: "Raveoli" , description: "delicious" )}
  let!(:ingredient_1) {dish_1.ingredients.create!(name: "cheese", calories: 234)}
  let!(:ingredient_2) {dish_1.ingredients.create!(name: "flour", calories: 100)}

  it 'shows name of chef' do 
    visit chef_path(chef_1.id)

    expect(page).to have_content(chef_1.name)
  end

  it 'has link to list of all ingredients' do 
    visit chef_path(chef_1.id)

    click_link "All Ingredients"

    expect(current_path).to eq(chef_ingredients_path(chef_1.id))
  end
end