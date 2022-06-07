require 'rails_helper'

RSpec.describe 'chef show page', type: :feature do
    before :each do
        @chef = Chef.create(name: "Chef Boyardee")
        @chef2 = Chef.create(name: "Chef Ramsay")
        @dish = @chef.dishes.create(name: "Ravioli", description: "Cheap.")
        @dish2 = @chef.dishes.create(name: "Lasagna", description: "Also cheap.")
        @ingredient = Ingredient.create(name: "Sodium", calories: 400)
        @ingredient2 = Ingredient.create(name: "Sauce", calories: 350)
        @ingredient3 = Ingredient.create(name: "Sugar", calories: 550)
        @ingredient4 = Ingredient.create(name: "Noodles", calories: 600)
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient.id}")
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient2.id}")
        DishIngredient.create(dish_id: "#{@dish2.id}", ingredient_id: "#{@ingredient3.id}")
        DishIngredient.create(dish_id: "#{@dish2.id}", ingredient_id: "#{@ingredient4.id}")
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient4.id}")
    end


    it 'shows chef name' do
        visit "/chefs/#{@chef.id}"
        expect(page).to have_content(@chef.name)
        expect(page).to_not have_content(@chef2.name)
    end

    it 'has a link to chefs ingredient index' do
        visit "/chefs/#{@chef.id}"
        click_link "Ingredient Index"
        expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    end

end