require 'rails_helper'

RSpec.describe Chef, type: :feature do
  describe 'the show page' do

    it 'tests user story 3' do
      # As a visitor
      # When I visit a chef's show page
      # I see the name of that chef
      # And I see a link to view a list of all ingredients that this chef uses in their dishes
      # When I click on that link
      # I'm taken to a chef's ingredient index page
      # and I can see a unique list of names of all the ingredients that this chef uses
      chef_1 = Chef.create!(name: "Mike Tyson")
      chef_2 = Chef.create!(name: "James Dean")
      dish_1 = chef_1.dishes.create!(name: "The Knockout", description: "lots of food on this one")
      dish_2 = chef_1.dishes.create!(name: "The Uppercut", description: "even more of food on this one")
      dish_3 = chef_1.dishes.create!(name: "The TKO", description: "even more of food on this one")

      ingredient_1 = Ingredient.create!(name:"Tomato", calories: 85)
      ingredient_2 = Ingredient.create!(name:"Rice", calories: 185)
      ingredient_3 = Ingredient.create!(name:"Butter", calories: 285)
      ingredient_4 = Ingredient.create!(name:"Sauce", calories: 55)
      ingredient_5 = Ingredient.create!(name:"Chocolate", calories: 105)
      ingredient_6 = Ingredient.create!(name:"Coffee", calories: 5)

      IngredientDish.create!(ingredient_id: ingredient_1.id, dish_id: dish_1.id)
      IngredientDish.create!(ingredient_id: ingredient_2.id, dish_id: dish_1.id)
      IngredientDish.create!(ingredient_id: ingredient_3.id, dish_id: dish_2.id)
      IngredientDish.create!(ingredient_id: ingredient_4.id, dish_id: dish_2.id)
      IngredientDish.create!(ingredient_id: ingredient_1.id, dish_id: dish_3.id)
      IngredientDish.create!(ingredient_id: ingredient_2.id, dish_id: dish_3.id)
      IngredientDish.create!(ingredient_id: ingredient_3.id, dish_id: dish_3.id)
      IngredientDish.create!(ingredient_id: ingredient_4.id, dish_id: dish_3.id)

      visit "/chefs/#{chef_1.id}"

      expect(page).to have_content("#{chef_1.name}")
      expect(page).to_not have_content("#{chef_2.name}")

      click_link("View a list of all ingredients")
      expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")

      expect(page).to have_content(ingredient_1.name, count:1)
      expect(page).to have_content(ingredient_2.name, count:1)
      expect(page).to have_content(ingredient_3.name, count:1)
      expect(page).to have_content(ingredient_4.name, count:1)
      expect(page).to_not have_content(ingredient_5.name, count:1)
      expect(page).to_not have_content(ingredient_6.name, count:1)

    end
  end
end
