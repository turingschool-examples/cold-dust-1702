# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef_1 = Chef.create!(name: "Thomas")
@chef_2 = Chef.create!(name: "Maya")

@dish_1 = @chef_1.dishes.create!(name: "Chicken Enchiladas", description: "Spicy enchiladas covered in cheese")
@dish_2 = @chef_1.dishes.create!(name: "Roasted Chicken Linguini", description: "Creamy pasta")
@dish_3 = @chef_1.dishes.create!(name: "Baked Ziti", description: "Red sauce with italian sausage")
@dish_4 = @chef_2.dishes.create!(name: "Shrimp pasta", description: "Rose sauce with sauteed shrimp")

@chicken = Ingredient.create!(name: "Chicken", calories: 400)
@noodles = Ingredient.create!(name: "Noodles", calories: 200)
@sausage = Ingredient.create!(name: "Sausage", calories: 500)
@peppers = Ingredient.create!(name: "Bell Pepper", calories: 50)
@shrimp = Ingredient.create!(name: "Shrimp", calories: 200)

DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @chicken.id)
DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @peppers.id)
DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @noodles.id)
DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @sausage.id)    
DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @shrimp.id)    
DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @noodles.id)   