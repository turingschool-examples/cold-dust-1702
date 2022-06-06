require 'rails_helper'

RSpec.describe 'Dish show page', type: :feature do 
  let!(:chef) { Chef.create!(name:'Swedish Chef') }

  let!(:dish1) { chef.dishes.create!(name: 'Hot Dog Helper', description: 'similar to hamburger helper, but with hot dogs')}
  let!(:dish2) { chef.dishes.create!(name: 'Just Desserts', description: 'its a pile of sand, the chef was confused, apologies')}

  let!(:hotdog) {dish1.ingredients.create!(name: 'hot dogs', calories: 1000)}
  let!(:helper) {dish1.ingredients.create!(name: 'helper', calories: 5000)}
  let!(:beef) {dish1.ingredients.create!(name: 'beef', calories: 5)}

  let!(:sand) {dish2.ingredients.create!(name: 'sand', calories: 6)}

  describe 'user story 1' do 
    it 'should show the dishes name and description' do 
      visit "/dishes/#{dish1.id}"

      expect(page).to have_content(dish1.name)
      expect(page).to have_content(dish1.description)
      expect(page).to_not have_content(dish2.name)
    end

    it 'should have a list of ingredients for the dish' do 
      visit "/dishes/#{dish1.id}"

      expect(page).to have_content(hotdog.name)
      expect(page).to have_content(helper.name)
      expect(page).to have_content(beef.name)
    end

    it 'has the chefs name' do 
      visit "/dishes/#{dish1.id}"

      expect(page).to have_content(chef.name)
    end
  end

  describe 'user story 2' do 
    it 'has a count of the calories' do 
      visit "/dishes/#{dish2.id}"

      expect(page).to have_content("calories per dish: 6")
    end
  end
end