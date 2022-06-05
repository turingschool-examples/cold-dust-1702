require 'rails_helper'

RSpec.describe Dish, type: :feature do
  describe 'the show page' do

    it 'tests user story 1' do
      # As a visitor
      # When I visit a dish's show page
      # I see the dish’s name and description
      # And I see a list of ingredients for that dish
      # And I see the chef's name
      chef_1 = Chef.create!(name: "Mike Tyson")
      chef_2 = Chef.create!(name: "James Dean")
      dish_1 = chef_1.dishes.create!(name: "The Knockout", description: "lots of food on this one")
      dish_2 = chef_1.dishes.create!(name: "The Uppercut", description: "even more of food on this one")

      ingredient_1 = Ingredient.create!(name:"Tomato", calories: 85)
      ingredient_2 = Ingredient.create!(name:"Rice", calories: 185)
      ingredient_3 = Ingredient.create!(name:"Butter", calories: 285)
      ingredient_4 = Ingredient.create!(name:"Sauce", calories: 55)

      IngredientDish.create!(ingredient_id: ingredient_1.id, dish_id: dish_1.id)
      IngredientDish.create!(ingredient_id: ingredient_2.id, dish_id: dish_1.id)
      IngredientDish.create!(ingredient_id: ingredient_3.id, dish_id: dish_2.id)
      IngredientDish.create!(ingredient_id: ingredient_4.id, dish_id: dish_2.id)

      visit "/dishes/#{dish_1.id}"
      save_and_open_page

      expect(page).to have_content("#{dish_1.name}")
      expect(page).to have_content("#{dish_1.description}")

      expect(page).to_not have_content("#{dish_2.name}")
      expect(page).to_not have_content("#{dish_2.description}")

      expect(page).to have_content("#{ingredient_1.name}")
      expect(page).to have_content("#{ingredient_2.name}")
      expect(page).to_not have_content("#{ingredient_3.name}")
      expect(page).to_not have_content("#{ingredient_4.name}")

      expect(page).to have_content("#{chef_1.name}")
      expect(page).to_not have_content("#{chef_2.name}")



    end
  end
end
