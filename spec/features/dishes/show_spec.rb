require 'rails_helper'

RSpec.describe 'Dish Show Page' do
    describe "Dish Show Page" do
        before :each do
            @chef = Chef.create!(name: 'Charles')
            @chef2 = Chef.create!(name: 'Barkley')
            @dish_1 = @chef.dishes.create!(name: "Fish", description: "Fresh Caught Salmon")
            @dish_2 = @chef.dishes.create!(name: "Steak", description: "Fresh Caught Cow")
            @ingredient_1 = Ingredient.create!(name: "Wild Salmon", calories: 100)
            @ingredient_2 = Ingredient.create!(name: "Carrots", calories: 50)
            @ingredient_3 = Ingredient.create!(name: "Steak", calories: 200)
            DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
            DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
            DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
        end

        it "displays dish name, discription, ingredients and chef" do
            visit "/dishes/#{@dish_1.id}"
            expect(page).to have_content("Name: Fish") 
            expect(page).to have_content("Description: Fresh Caught Salmon") 
            expect(page).to have_content("Wild Salmon") 
            expect(page).to have_content("Carrots") 
            expect(page).to have_content("Chef Charles") 
            expect(page).to_not have_content("Steak") 
            expect(page).to_not have_content("Chef Barkley") 
        end
        
    end
    
end