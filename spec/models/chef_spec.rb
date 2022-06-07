require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:dish_ingredients).through(:dishes)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

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

  describe "#instance_methods" do
    it "#unique_ingredients returns a list of unique ingredients" do
      names_array = ina.unique_ingredients.pluck(:name)
      expect(names_array.count(tomato.name)).to eq(1)
      expect(names_array.count(flour.name)).to eq(1)
      expect(names_array.count(egg.name)).to eq(1)
      expect(names_array.count(butter.name)).to eq(1)
      expect(names_array.count(sugar.name)).to eq(1)
      expect(names_array.count(cheese.name)).to eq(0)
      expect(names_array.count(pepper.name)).to eq(0)
    end

    it "#top_3_ingredients returns the top 3 ingredients used by the chef" do
      expect(bobby.top_3_ingredients).to eq([flour, tomato, cheese])
    end
  end
end
