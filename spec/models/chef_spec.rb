require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe 'methods' do
    it 'gives me the unique ingredients for a chef' do
      chef_1 = Chef.create!(name: "Mike Tyson")
      chef_2 = Chef.create!(name: "James Dean")
      dish_1 = chef_1.dishes.create!(name: "The Knockout", description: "lots of food on this one")
      dish_2 = chef_1.dishes.create!(name: "The Uppercut", description: "even more of food on this one")
      dish_3 = chef_1.dishes.create!(name: "The TKO", description: "even more of food on this one")

      ingredient_1 = Ingredient.create!(name:"Tomato", calories: 85)
      ingredient_2 = Ingredient.create!(name:"Rice", calories: 185)
      ingredient_3 = Ingredient.create!(name:"Butter", calories: 285)
      ingredient_4 = Ingredient.create!(name:"Sauce", calories: 55)
      ingredient_5 = Ingredient.create!(name:"Chocolate", calories: 105)
      ingredient_6 = Ingredient.create!(name:"Coffee", calories: 5)

      IngredientDish.create!(ingredient_id: ingredient_1.id, dish_id: dish_1.id)
      IngredientDish.create!(ingredient_id: ingredient_2.id, dish_id: dish_1.id)
      IngredientDish.create!(ingredient_id: ingredient_3.id, dish_id: dish_2.id)
      IngredientDish.create!(ingredient_id: ingredient_4.id, dish_id: dish_2.id)
      IngredientDish.create!(ingredient_id: ingredient_1.id, dish_id: dish_3.id)
      IngredientDish.create!(ingredient_id: ingredient_2.id, dish_id: dish_3.id)
      IngredientDish.create!(ingredient_id: ingredient_3.id, dish_id: dish_3.id)
      IngredientDish.create!(ingredient_id: ingredient_4.id, dish_id: dish_3.id)

      expect(chef_1.unique_ingredients).to eq([ingredient_1, ingredient_2, ingredient_3, ingredient_4])

    end
  end
end
