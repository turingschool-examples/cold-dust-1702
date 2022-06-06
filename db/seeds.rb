# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


chef = Chef.create!(name: "Rob")

dish1 = chef.dishes.create!(name: "Pancakes", description: "Stack of 3 fluffy pancakes")
dish2 = chef.dishes.create!(name: "Omelette", description: "Served with home fries")

milk = Ingredient.create!(name: "milk", calories: 90)
flour = Ingredient.create!(name: "flour", calories: 60)
eggs = Ingredient.create!(name: "eggs", calories: 80)
potatoes = Ingredient.create!(name: "potatoes", calories: 100)

DishIngredient.create!(dish: dish1, ingredient: milk)
DishIngredient.create!(dish: dish1, ingredient: flour)
DishIngredient.create!(dish: dish1, ingredient: eggs)
DishIngredient.create!(dish: dish2, ingredient: potatoes)
