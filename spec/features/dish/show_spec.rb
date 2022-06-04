require 'rails_helper'

RSpec.describe 'dish show page' do 
  let!(:chef_1) {Chef.create!(name: "Boyardee")}
  let!(:dish_1) {chef_1.dishes.create!(name: "Raveoli" , description: "delicious" )}
  let!(:ingredient_1) {dish_1.ingredients.create!(name: "cheese", calories: 234)}
  let!(:ingredient_2) {dish_1.ingredients.create!(name: "flour", calories: 100)}

  it 'shows dish name and description' do 
    visit chef_dish_path(chef_1.id, dish_1.id)

    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_1.description)
  end

  it 'shows dish ingredients' do 
    visit chef_dish_path(chef_1.id, dish_1.id)

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
  end

  it 'shows dish chef' do 
    visit chef_dish_path(chef_1.id, dish_1.id)

    expect(page).to have_content(chef_1.name)
  end
end