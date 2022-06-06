# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chef1 = Chef.create!(name: 'ol Stirl')

    @dish1 = Dish.create!(name: 'Hot dog', description: 'Big gourmet hot dog', chef_id: chef1.id)
    @dish2 = Dish.create!(name: 'Rice n Beans', description: 'Rice that includes beans in it', chef_id: chef1.id)

    @ingredient1 = Ingredient.create!(name: 'Mustard', calories: 5)
    @ingredient2 = Ingredient.create!(name: 'Bun', calories: 100)
    @ingredient3 = Ingredient.create!(name: 'Vegetarian hot dog', calories: 150)
    @ingredient4 = Ingredient.create!(name: 'Rice', calories: 50)
    @ingredient5 = Ingredient.create!(name: 'Black Beans', calories: 150)
    @ingredient6 = Ingredient.create!(name: 'Jalapenos', calories: 50)

    @dish_ingredient1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient1.id)
    @dish_ingredient2 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient2.id)
    @dish_ingredient3 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient3.id)
    @dish_ingredient7 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient6.id)
    @dish_ingredient4 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient4.id)
    @dish_ingredient5 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient5.id)
    @dish_ingredient6 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient6.id)
