require "rails_helper"

RSpec.describe Dish, type: :feature do
  describe "visitors to dish show page" do
    before(:each) do
      @chef1 = Chef.create!(name: "Cliff")
      @chef2 = Chef.create!(name: "Tony")

      @dish1 = @chef1.dishes.create!(name: "chicken", description: "good")
      @dish2 = @chef2.dishes.create!(name: "fish", description: "poor")
      @dish3 = @chef1.dishes.create!(name: "beef", description: "great")
      @dish4 = @chef2.dishes.create!(name: "veg", description: "practical")

      @ingredient1 = Ingredient.create!(name: "ginger", calories: 1)
      @ingredient2 = Ingredient.create!(name: "sporty", calories: 10)
      @ingredient3 = Ingredient.create!(name: "posh", calories: 20)
      @ingredient4 = Ingredient.create!(name: "scary", calories: 30)
      @ingredient5 = Ingredient.create!(name: "baby", calories: 40)
      @ingredient6= Ingredient.create!(name: "old", calories: 100)

      @dishes_ingredient1 = @ingredient1.dishes_ingredients.create!(dish_id: @dish1.id)
      @dishes_ingredient2 = @ingredient2.dishes_ingredients.create!(dish_id: @dish1.id)
      @dishes_ingredient3 = @ingredient3.dishes_ingredients.create!(dish_id: @dish2.id)
      @dishes_ingredient4 = @ingredient4.dishes_ingredients.create!(dish_id: @dish2.id)
      @dishes_ingredient5 = @ingredient5.dishes_ingredients.create!(dish_id: @dish3.id)
      @dishes_ingredient6 = @ingredient6.dishes_ingredients.create!(dish_id: @dish3.id)
      @dishes_ingredient7 = @ingredient2.dishes_ingredients.create!(dish_id: @dish4.id)
      @dishes_ingredient8 = @ingredient1.dishes_ingredients.create!(dish_id: @dish2.id)
      @dishes_ingredient9 = @ingredient3.dishes_ingredients.create!(dish_id: @dish3.id)
      @dishes_ingredient10 = @ingredient5.dishes_ingredients.create!(dish_id: @dish4.id)
      @dishes_ingredient11 = @ingredient6.dishes_ingredients.create!(dish_id: @dish1.id)

      visit "/dish/#{@dish1.id}"
    end

    it "will see dish name, description, chef name, and list of ingredients" do
      within("#gen_info") do
        expect(page).to have_content("Name: Chicken")
        expect(page).to_not have_content("Name: Beef")
        expect(page).to have_content("Description: Good")
        expect(page).to have_content("Chef: Cliff")
        expect(page).to_not have_content("Chef: Tony")
      end 
      within("#ingredients") do
        expect(page).to have_content("ginger")
        expect(page).to have_content("sporty")
        expect(page).to have_content("old")
        expedt(page).to_not have_content("posh")
        expedt(page).to_not have_content("scary")
        expedt(page).to_not have_content("baby")
      end
    end
  end
end