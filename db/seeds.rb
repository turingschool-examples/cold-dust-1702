# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@emeril = Chef.new(name: "Emeril")
@finney = Chef.new(name: "Finney")
@Bob = Chef.new(name: "Bob")

@pene = @emeril.dishes.create!(name: "Pene", description: "pasta w/ sauce")
@lasagna = @emeril.dishes.create!(name: "Lasagna", description: "Layers of cheese, meat, and dough")
@pizza = @emeril.dishes.create!(name: "Pizza", description: "Marinara")

@steak = @emeril.dishes.create!(name: "Steak", description: "Rib Eye")
@toast = @emeril.dishes.create!(name: "Toast", description: "buttered bread")
@cake = @emeril.dishes.create!(name: "Cake", description: "Cheesecake")

@soup = @emeril.dishes.create!(name: "Soup", description: "De Jour")
@sando = @emeril.dishes.create!(name: "Sando", description: "PB&J")
@cereal = @emeril.dishes.create!(name: "Ceral", description: "Capn Crunch")

@meat = Ingredient.create!(name: "Meat", calories: 300)
@pasta = Ingredient.create!(name: "Pasta", calories: 400)
@bread = Ingredient.create!(name: "Bread", calories: 200)
@water = Ingredient.create!(name: "Meat", calories: 100)

@di_1 = DishIngredient.create!(dish_id: @pene.id, ingredient_id: @pasta.id)
@di_2 = DishIngredient.create!(dish_id: @lasagna.id, ingredient_id: @pasta.id)
@di_3 = DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @bread.id)

@di_4 = DishIngredient.create!(dish_id: @steak.id, ingredient_id: @meat.id)
@di_5 = DishIngredient.create!(dish_id: @toast.id, ingredient_id: @bread.id)
@di_6 = DishIngredient.create!(dish_id: @cake.id, ingredient_id: @bread.id)

@di_7 = DishIngredient.create!(dish_id: @soup.id, ingredient_id: @water.id)
@di_8 = DishIngredient.create!(dish_id: @sando.id, ingredient_id: @bread.id)
@di_9 = DishIngredient.create!(dish_id: @cereal.id, ingredient_id: @water .id)