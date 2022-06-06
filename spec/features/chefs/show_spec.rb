require 'rails_helper'

RSpec.describe 'Chef show page', type: :feature do
  let!(:chef) { Chef.create!(name:'Swedish Chef') }
  let!(:chef2) { Chef.create!(name: 'Bob')}

  let!(:warmest_color) {chef2.dishes.create!(name: 'blue is the warmest cheese', description: 'a blue cheese burger')}
  let!(:kraut_down) {chef2.dishes.create!(name: 'the final kraut down', description: 'a polish sausage with kraut')}
  let!(:cheesers) {chef2.dishes.create!(name: 'eggers cant be cheesers', description: 'burger with a fried egg on it')}
  let!(:dish2) { chef.dishes.create!(name: 'Just Desserts', description: 'its a pile of sand, the chef was confused, apologies')}

  let!(:sand) {Ingredient.create!(name: 'sand', calories: 6)}
  let!(:beef) {Ingredient.create!(name: 'beef', calories: 5)}
  let!(:blue) {Ingredient.create!(name: 'blue cheese', calories: 100)}
  let!(:bbq) {Ingredient.create!(name: 'barbeque sauce', calories: 20)}
  let!(:bun) {Ingredient.create!(name: 'bun', calories: 10000)}
  let!(:spicy_mustard) {Ingredient.create!(name: 'spicy mustard', calories: 5000)}
  let!(:hot_kraut) {Ingredient.create!(name: 'sour kraut', calories: 5000)}
  let!(:kielbasa) {Ingredient.create!(name: 'kielbasa sausage', calories: 5000)}
  let!(:pickles) {Ingredient.create!(name: 'pickles', calories: 10)}
  let!(:egg) {Ingredient.create!(name: 'egg', calories: 300)}



  let!(:ingredient_dish1) {IngredientDish.create!(dish: warmest_color, ingredient: beef)}
  let!(:ingredient_dish2) {IngredientDish.create!(dish: warmest_color, ingredient: blue)}
  let!(:ingredient_dish3) {IngredientDish.create!(dish: warmest_color, ingredient: bbq)}
  let!(:ingredient_dish4) {IngredientDish.create!(dish: warmest_color, ingredient: bun)}
  let!(:ingredient_dish5) {IngredientDish.create!(dish: warmest_color, ingredient: pickles)}

  let!(:ingredient_dish6) {IngredientDish.create!(dish: kraut_down, ingredient: bun)}
  let!(:ingredient_dish7) {IngredientDish.create!(dish: kraut_down, ingredient: spicy_mustard)}
  let!(:ingredient_dish8) {IngredientDish.create!(dish: kraut_down, ingredient: hot_kraut)}
  let!(:ingredient_dish9) {IngredientDish.create!(dish: kraut_down, ingredient: kielbasa)}
  let!(:ingredient_dish10) {IngredientDish.create!(dish: kraut_down, ingredient: pickles)}

  let!(:ingredient_dish11) {IngredientDish.create!(dish: cheesers, ingredient: pickles)}
  let!(:ingredient_dish12) {IngredientDish.create!(dish: cheesers, ingredient: egg)}
  let!(:ingredient_dish13) {IngredientDish.create!(dish: cheesers, ingredient: beef)}
  let!(:ingredient_dish14) {IngredientDish.create!(dish: cheesers, ingredient: bun)}


  describe 'user story 3' do 
    it 'has the chef and a link to all of that chefs ingredients' do 
      visit "/chefs/#{chef2.id}"
      
      expect(page).to have_content(chef2.name)
      click_link "Ingredients in #{chef2.name}'s Dishes"
      expect(current_path).to eq("/chefs/#{chef2.id}/ingredients")
    end
  end

  describe 'it made sense to me' do 
    it 'has each dish from that chef on the show page' do 
      visit "/chefs/#{chef2.id}"

      expect(page).to have_content(warmest_color.name)
      expect(page).to have_content(kraut_down.name)
      expect(page).to have_content(cheesers.name)
      expect(page).to_not have_content(dish2.name)
    end
  end
end