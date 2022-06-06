require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :feature do
  describe 'User Story 1' do
    it "displays a Dish's information" do
      chef = Chef.create!(name: "Julia Adults")
      dish1 = chef.dishes.create!(name: "Pizza", description: "It's a pizza.")
      ingre1 = Ingredient.create!(name: "dough", calories: 200)
      ingre2 = Ingredient.create!(name: "sauce", calories: 30)
      ingre3 = Ingredient.create!(name: "cheese", calories: 100)
      dish_ingre1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre1.id)
      dish_ingre2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre2.id)
      dish_ingre3 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingre3.id)

      visit dish_path(dish1)

      expect(page).to have_content("Dish Name: Pizza")
      expect(page).to have_content("Description: It's a pizza.")
      expect(page).to have_content("Chef: Julia Adults")

      within "#ingredients" do
        expect(page).to have_content("dough")
        expect(page).to have_content("sauce")
        expect(page).to have_content("cheese")
      end
    end
  end
end
