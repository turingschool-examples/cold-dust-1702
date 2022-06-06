require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
  describe 'relationships' do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'class methods' do
    it 'can count the number of calories for a dish' do
      chef1 = Chef.create!(name: 'ol Stirl')

      dish1 = Dish.create!(name: 'Hot dog', description: 'Big gourmet hot dog', chef_id: chef1.id)

      ingredient1 = Ingredient.create!(name: 'Mustard', calories: 5)
      ingredient2 = Ingredient.create!(name: 'Bun', calories: 100)
      ingredient3 = Ingredient.create!(name: 'Vegetarian hot dog', calories: 150)
      ingredient4 = Ingredient.create!(name: 'Jalapenos', calories: 50)

      dish_ingredient1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient1.id)
      dish_ingredient2 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient2.id)
      dish_ingredient3 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient3.id)
      dish_ingredient4 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient4.id)

      expect(dish1.calorie_count).to eq(305)
    end
  end
end
