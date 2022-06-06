require 'rails_helper'

RSpec.describe 'Merchant Show Dash', type: :feature do
  before(:each) do
    @jimbob = Chef.create!(name: "Jimbob Dudeguy")
    @spaghetti = @jimbob.dishes.create!(name: "Spaghetti" , description: "Wholesome ol' carbs and tomato")
    @noodle = Ingredient.create!(name: "Pasta", calories: 500)
    @sauce = Ingredient.create!(name: "Tomato Sauce", calories: 85)
  end

  it 'has a dishes name and description on the page' do
    visit "/dishes/#{@spaghetti.id}"

    expect(page).to have_content(@spaghetti.name)
    expect(page).to have_content(@spaghetti.description)
  end
end
