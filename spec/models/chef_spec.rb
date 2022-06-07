require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many(:dishes) }
    it { should have_many(:dish_ingredients).through(:dishes) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "instance methods" do
    it "#unique_ingredients" do
      chef_1 = Chef.create!(name: "Lee Kwan Yew")
      dish_1 = Dish.create!(name:"Chicken Rice", description: "This is a local Singaporean dish", chef_id: chef_1.id)
      dish_2 = Dish.create!(name:"Lamb Rice", description: "This is not a local Singaporean dish", chef_id: chef_1.id)
      dish_3 = Dish.create!(name:"Chicken Noodles", description: "This was a local Singaporean dish", chef_id: chef_1.id)
      ingredient_1 = Ingredient.create!(name: "chicken", calories: 1000)
      ingredient_2 = Ingredient.create!(name: "rice", calories: 600)
      ingredient_3 = Ingredient.create!(name: "lamb", calories: 700)
      ingredient_4 = Ingredient.create!(name: "noodles", calories: 1200)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)
      DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_4.id)

      expect(chef_1.unique_ingredients).to eq([ingredient_1, ingredient_2, ingredient_3, ingredient_4])
    end
  end

  it "#popular_ingredients" do
      chef_1 = Chef.create!(name: "Lee Kwan Yew")
      dish_1 = chef_1.dishes.create!(name:"Chicken Rice", description: "This is a local Singaporean dish")
      dish_2 = chef_1.dishes.create!(name:"Lamb Rice", description: "This is not a local Singaporean dish")
      dish_3 = chef_1.dishes.create!(name:"Chicken Noodles", description: "This was a local Singaporean dish")
      dish_4 = chef_1.dishes.create!(name:"Lamb Couscous", description: "This was once a local Singaporean dish")
      ingredient_1 = Ingredient.create!(name: "chicken", calories: 1000)
      ingredient_2 = Ingredient.create!(name: "rice", calories: 600)
      ingredient_3 = Ingredient.create!(name: "lamb", calories: 700)
      ingredient_4 = Ingredient.create!(name: "noodles", calories: 1200)
      ingredient_5 = Ingredient.create!(name: "couscous", calories: 1200)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)
      DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_4.id)
      DishIngredient.create!(dish_id: dish_4.id, ingredient_id: ingredient_3.id)
      DishIngredient.create!(dish_id: dish_4.id, ingredient_id: ingredient_5.id)

      expected = chef_1.popular_ingredients.map do |ingredient|
        ingredient
      end
      expect(chef_1.popular_ingredients).to eq(expected)
  end
end
