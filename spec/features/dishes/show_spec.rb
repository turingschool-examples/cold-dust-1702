require 'rails_helper'

RSpec.describe 'Dish show page', type: :feature do 
  let!(:chef) { Chef.create!(name:'Swedish Chef') }

  let!(:dish1) { chef.dishes.create!(name: 'Hot Dog Helper', description: 'similar to hamburger helper, but with hot dogs')}
  let!(:dish2) { chef.dishes.create!(name: 'Just Desserts', description: 'its a pile of sand, the chef was confused, apologies')}
  describe 'user story 1' do 
    it 'should show the dishes name and description' do 
      visit "/dishes/#{dish1.id}"

      expect(page).to have_content(dish1.name)
      expect(page).to have_content(dish1.descriptions)
      expect(page).to_not have_content(dish2.name)
    end
  end
end