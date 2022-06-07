require 'rails_helper'

RSpec.describe "Dish show page", type: :feature do
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
    describe "Story 1 of 3" do
    # As a visitor
    # When I visit a dish's show page
    # I see the dish's name and description
    # And I see a list of ingredients for that dish
    # And I see the chef's name
    it "has the dish's name and description" do
      visit "/dishes/#{pancakes.id}"

      expect(page).to have_content("Pancakes")
      expect(page).to have_content("Another of Wes' favorites")
      expect(page).to_not have_content("Pizza")
    end

    it "has a list of ingredients for that dish" do
      visit "/dishes/#{pancakes.id}"

      expect(page).to have_content(sugar.name)
      expect(page).to have_content(flour.name)
      expect(page).to have_content(egg.name)
      expect(page).to have_content(butter.name)
      expect(page).to_not have_content(tomato.name)
    end

    it "has the chef's name" do
      visit "/dishes/#{pancakes.id}"

      expect(page).to have_content(ina.name)
      expect(page).to_not have_content(bobby.name)
    end
  end

  describe "Story 2 of 3" do
    # As a visitor
    # When I visit a dish's show page
    # I see the total calorie count for that dish.
    it "has the total calorie count for the dish" do
      visit "/dishes/#{spaghetti_bobby.id}"

      expect(page).to have_content("71.33 calories")
      expect(page).to_not have_content("26.33 calories")# for pizza
    end
  end
end
