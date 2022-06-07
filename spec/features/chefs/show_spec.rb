require 'rails_helper'

RSpec.describe "Chef show page", type: :feature do
  ina = Chef.create(name: "Ina Garten")
  bobby = Chef.create(name: "Bobby Flay")

  spaghetti_ina = Dish.create(name: "Ina's Spaghetti", description: "Classic noodles n tomato", chef: ina)
  pancakes = Dish.create(name: "Pancakes", description: "Another of Wes' favorites", chef: ina)
  scrambled_eggs = Dish.create(name: "Scrambled eggs", description: "Breakfast staple", chef: ina)

  spaghetti_bobby = Dish.create(name: "Bobby's Spaghetti", description: "Classic noodles n tomato", chef: bobby)
  cacio_e_pepe = Dish.create(name: "Cacio e pepe", description: "One of Wes' favorites", chef: bobby)
  pizza = Dish.create(name: "Pizza", description: "Delectable!", chef: bobby)

  tomato = Ingredient.create(name: "Tomato(1)", calories: 11)
  flour = Ingredient.create(name: "Flour(1 cup)", calories: 53)
  cheese = Ingredient.create(name: "Cheese(various)", calories: 15)
  egg = Ingredient.create(name: "Egg(1)", calories: 150)
  sugar = Ingredient.create(name: "Sugar(half cup)", calories: 175)
  butter = Ingredient.create(name: "Butter(1 Tbsp)", calories: 45)
  pepper = Ingredient.create(name: "Pepper(enough)", calories: 1)


  add_ingredient1 = DishIngredient.create(dish: spaghetti_ina, ingredient: tomato)
  add_ingredient2 = DishIngredient.create(dish: spaghetti_ina, ingredient: flour)
  add_ingredient3 = DishIngredient.create(dish: spaghetti_ina, ingredient: egg)

  add_ingredient4 = DishIngredient.create(dish: pancakes, ingredient: sugar)
  add_ingredient5 = DishIngredient.create(dish: pancakes, ingredient: flour)
  add_ingredient6 = DishIngredient.create(dish: pancakes, ingredient: egg)
  add_ingredient7 = DishIngredient.create(dish: pancakes, ingredient: butter)

  add_ingredient8 = DishIngredient.create(dish: scrambled_eggs, ingredient: egg)
  add_ingredient9 = DishIngredient.create(dish: scrambled_eggs, ingredient: butter)

  add_ingredient10 = DishIngredient.create(dish: spaghetti_bobby, ingredient: tomato)
  add_ingredient11 = DishIngredient.create(dish: spaghetti_bobby, ingredient: flour)
  add_ingredient12 = DishIngredient.create(dish: spaghetti_bobby, ingredient: egg)

  add_ingredient13 = DishIngredient.create(dish: cacio_e_pepe, ingredient: cheese)
  add_ingredient14 = DishIngredient.create(dish: cacio_e_pepe, ingredient: flour)
  add_ingredient15 = DishIngredient.create(dish: cacio_e_pepe, ingredient: egg)
  add_ingredient16 = DishIngredient.create(dish: cacio_e_pepe, ingredient: pepper)

  add_ingredient17 = DishIngredient.create(dish: pizza, ingredient: flour)
  add_ingredient18 = DishIngredient.create(dish: pizza, ingredient: tomato)
  add_ingredient19 = DishIngredient.create(dish: pizza, ingredient: cheese)
  describe "Story 3 of 3" do
    # As a visitor
    # When I visit a chef's show page
    # I see the name of that chef
    # And I see a link to view a list of all ingredients that this chef uses in their dishes
    # When I click on that link
    # I'm taken to a chef's ingredient index page
    # and I can see a unique list of names of all the ingredients that this chef uses
    it "has the chef's name" do
      visit "/chefs/#{ina.id}"

      expect(page).to have_content("Ina Garten")
    end

    it "has a link that takes you to this chef's ingredient index page" do
      visit "/chefs/#{ina.id}"

      click_link "View This Chef's Ingredients"

      expect(current_path).to eq("/chefs/#{ina.id}/ingredients")
    end

    it "chef's ingredient index page has a unique list of names of all the ingredients that this chef uses" do
      visit "/chefs/#{ina.id}/ingredients"

      expect(page).to have_content(tomato.name, count: 1)
      expect(page).to have_content(flour.name, count: 1)
      expect(page).to have_content(egg.name, count: 1)
      expect(page).to have_content(butter.name, count: 1)
      expect(page).to have_content(sugar.name, count: 1)
      expect(page).to_not have_content(cheese.name)
      expect(page).to_not have_content(pepper.name)
    end
  end

  describe "Extension" do
    # As a visitor
    # When I visit a chef's show page
    # I see the three most popular ingredients that the chef uses in their dishes
    # (Popularity is based off of how many dishes use that ingredient)
    it "shows the three most popular ingredients" do
      visit "/chefs/#{bobby.id}"

      expect(page).to have_content("1. #{flour.name}")
      expect(page).to have_content("2. #{tomato.name}")
      expect(page).to have_content("3. #{cheese.name}")
      # tomato, cheese, and egg are tied so we're also ordering by :id and egg gets bumped...sorry egg
    end
  end
end
