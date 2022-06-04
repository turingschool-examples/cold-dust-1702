require 'rails_helper' 

RSpec.describe 'chefs ingredients index page' do 
  let!(:chef_1) {Chef.create!(name: "Boyardee")}
  let!(:dish_1) {chef_1.dishes.create!(name: "Raveoli" , description: "delicious" )}
  let!(:dish_2) {chef_1.dishes.create!(name: "Spagetti" , description: "yum" )}
  let!(:ingredient_3) {dish_2.ingredients.create!(name: "cheese", calories: 234)}
  let!(:ingredient_1) {dish_1.ingredients.create!(name: "cheese", calories: 234)}
  let!(:ingredient_2) {dish_1.ingredients.create!(name: "flour", calories: 100)}

  it 'has unique list of all chefs ingredients' do 
    visit chef_ingredients_path(chef_1.id)

    expect(page).to have_content("flour")
    expect(page).to have_content("cheese", count: 1)
  end
end