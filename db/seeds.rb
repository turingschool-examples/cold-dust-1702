# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ina = Chef.create(name: "Ina Garten")
bobby = Chef.create(name: "Bobby Flay")

spaghetti_ina = Dish.create(name: "Ina's Spaghetti", description: "Classic noodles n tomato", chef: ina)
pancakes = Dish.create(name: "Pancakes", description: "Another of Wes' favorites", chef: ina)
scrambled_eggs = Dish.create(name: "Scrambled eggs", description: "Breakfast staple", chef: ina)

spaghetti_bobby = Dish.create(name: "Bobby's Spaghetti", description: "Classic noodles n tomato", chef: bobby)
cacio_e_pepe = Dish.create(name: "Cacio e pepe", description: "One of Wes' favorites", chef: bobby)
pizza = Dish.create(name: "Pizza", description: "Delectable!", chef: bobby)

tomato = Ingredient.create(name: "Tomato(1)", calories: 10)
flour = Ingredient.create(name: "Flour(1 cup)", calories: 50)
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
