require 'rails_helper'

RSpec.describe 'Dishes Show Page', type: :feature do
  let!(:chef1) {Chef.create(name: "Chef Boy R Dee")}
  let!(:chef2) {Chef.create(name: "Gordon Ramsay")}

  let!(:dish1) {chef1.dishes.create(name: "Macaroni and Cheese", description: "Delicious pasta and cheese")}
  let!(:dish2) {chef1.dishes.create(name: "Beef Wellington", description: "Medium Rare Beef with a bread cover")}
  let!(:ingredient1) {dish1.ingredients.create(name: "Pasta", calories: "400")}
  let!(:ingredient2) {dish1.ingredients.create(name: "Cheese", calories: "300")}
  let!(:ingredient3) {dish2.ingredients.create(name: "Beef", calories: "250")}
  let!(:ingredient4) {dish2.ingredients.create(name: "Bread", calories: "600")}

  it "can display the dishes name and ingredients" do
    visit "/dishes/#{dish1.id}"

    within '#dish-data' do
      expect(page).to have_content("Macaroni and Cheese")
      expect(page).to have_content("Delicious pasta and cheese")
      expect(page).to_not have_content("Beef Wellington")
      expect(page).to_not have_content("Medium Rare Beef with a bread cover")
      expect(page).to have_content("Pasta")
      expect(page).to have_content("Cheese")
      expect(page).to_not have_content("Beef")
      expect(page).to_not have_content("250")
      expect(page).to have_content("Chef Boy R Dee")
      expect(page).to_not have_content("Gordon Ramsay")
    end
  end
end
