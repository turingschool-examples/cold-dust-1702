require 'rails_helper'

RSpec.describe Ingredient, type: :feature do 
  describe 'user story 3' do 
        before(:each) do
      @chef1 = Chef.create!(name: "Cliff")
      @dish1 = @chef1.dishes.create!(name: "chicken", description: "good")
      @dish3 = @chef1.dishes.create!(name: "beef", description: "great")

      @ingredient1 = Ingredient.create!(name: "ginger", calories: 1)
      @ingredient2 = Ingredient.create!(name: "sporty", calories: 10)
      @ingredient3 = Ingredient.create!(name: "posh", calories: 20)
      @ingredient4 = Ingredient.create!(name: "scary", calories: 30)
      @ingredient5 = Ingredient.create!(name: "baby", calories: 40)
      @ingredient6= Ingredient.create!(name: "old", calories: 100)

      @dishes_ingredient1 = @ingredient1.dishes_ingredients.create!(dish_id: @dish1.id)
      @dishes_ingredient2 = @ingredient2.dishes_ingredients.create!(dish_id: @dish1.id)
      @dishes_ingredient5 = @ingredient5.dishes_ingredients.create!(dish_id: @dish3.id)
      @dishes_ingredient6 = @ingredient6.dishes_ingredients.create!(dish_id: @dish3.id)
      @dishes_ingredient9 = @ingredient3.dishes_ingredients.create!(dish_id: @dish3.id)
      @dishes_ingredient11 = @ingredient6.dishes_ingredients.create!(dish_id: @dish1.id)
      
    
  end
    it 'has a unique list of all the ingredients from one chef' do
      visit "/chef/#{@chef1.id}/ingredient"

      expect(page).to have_content0("ginger")
      expect(page).to have_content("sporty")
      expect(page).to have_content("posh")
      expect(page).to have_content("baby")
      expect(page).to have_content("old")
      expect(page).to_not have_content("scary")
    end
end
end