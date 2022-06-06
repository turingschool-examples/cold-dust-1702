# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef = Chef.create!(name: "Thomas")

@dish_1 = @chef.dishes.create!(name: "Chicken Enchiladas", description: "Spicy enchiladas covered in cheese")
@dish_2 = @chef.dishes.create!(name: "Roasted Chicken Linguini", description: "Creamy pasta")
@dish_3 = @chef.dishes.create!(name: "Baked Ziti", description: "Red sauce with italian sausage")

@chicken = Ingredient.create!(name: "Chicken", calories: 400)
@noodles = Ingredient.create!(name: "Noodles", calories: 200)
@sausage = Ingredient.create!(name: "Sausage", calories: 500)
@peppers = Ingredient.create!(name: "Bell Pepper", calories: 50)

DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @chicken.id)
DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @peppers.id)
DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @noodles.id)
DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @sausage.id)
