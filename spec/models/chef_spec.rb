require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many :ingredients}
  end

  describe 'instance methods' do
    it 'can retrieve a unique list of chefs ingredients' do
      @emeril = Chef.create!(name: "Emeril")
      @finney = Chef.create!(name: "Finney")
      @Bob = Chef.create!(name: "Bob")

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
      @di_10 = DishIngredient.create!(dish_id: @pene.id, ingredient_id: @meat.id)
      @di_2 = DishIngredient.create!(dish_id: @lasagna.id, ingredient_id: @pasta.id)
      @di_3 = DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @bread.id)

      @di_4 = DishIngredient.create!(dish_id: @steak.id, ingredient_id: @meat.id)
      @di_5 = DishIngredient.create!(dish_id: @toast.id, ingredient_id: @bread.id)
      @di_6 = DishIngredient.create!(dish_id: @cake.id, ingredient_id: @bread.id)

      @di_7 = DishIngredient.create!(dish_id: @soup.id, ingredient_id: @water.id)
      @di_8 = DishIngredient.create!(dish_id: @sando.id, ingredient_id: @bread.id)
      @di_9 = DishIngredient.create!(dish_id: @cereal.id, ingredient_id: @water .id)
      
      expect(@emeril.ingredients_uniq).to eq(["Pasta", "Meat", "Bread"])
    end

    it 'can give a chefs top 3 ingredients in order' do
      @emeril = Chef.create!(name: "Emeril")

      @pene = @emeril.dishes.create!(name: "Pene", description: "pasta w/ sauce")
      @lasagna = @emeril.dishes.create!(name: "Lasagna", description: "Layers of cheese, meat, and dough")
      @pizza = @emeril.dishes.create!(name: "Pizza", description: "Marinara")

      @meat = Ingredient.create!(name: "Meat", calories: 300)
      @pasta = Ingredient.create!(name: "Pasta", calories: 400)
      @bread = Ingredient.create!(name: "Bread", calories: 200)
      @water = Ingredient.create!(name: "Meat", calories: 100)

      @di_1 = DishIngredient.create!(dish_id: @pene.id, ingredient_id: @pasta.id)
      @di_10 = DishIngredient.create!(dish_id: @pene.id, ingredient_id: @meat.id)
      @di_2 = DishIngredient.create!(dish_id: @lasagna.id, ingredient_id: @pasta.id)
      @di_3 = DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @bread.id)
      @di_11 = DishIngredient.create!(dish_id: @pene.id, ingredient_id: @bread.id)
      @di_12 = DishIngredient.create!(dish_id: @lasagna.id, ingredient_id: @bread.id)
      @di_13 = DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @bread.id)

      expect(@emeril.top_3_ingredients()).to eq([@bread, @pasta, @meat])
    end
  end
end
