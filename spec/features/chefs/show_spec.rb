require 'rails_helper'

RSpec.describe 'Chef show page', type: :feature do
  let!(:chef) { Chef.create!(name:'Swedish Chef') }
  let!(:chef2) { Chef.create!(name: 'Bob')}

  let!(:warmest_color) {chef2.dishes.create!(name: 'blue is the warmest cheese', description: 'a blue cheese burger')}
  let!(:kraut_down) {chef2.dishes.create!(name: 'the final kraut down', description: 'a polish sausage with kraut')}
  let!(:dish2) { chef.dishes.create!(name: 'Just Desserts', description: 'its a pile of sand, the chef was confused, apologies')}


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
      expect(page).to_not have_content(dish2.name)
    end
  end
end