require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :dishes }
    it { should have_many(:ingredients).through(:dishes) }
  end

  describe 'instance methods' do
    it 'can generate a list of all ingredients the chef uses' do
      chef1 = Chef.create!(name: 'ol Stirl')
      chef2 = Chef.create!(name: 'billy bop')

      dish1 = Dish.create!(name: 'Hot dog', description: 'Big gourmet hot dog', chef_id: chef1.id)
      dish2 = Dish.create!(name: 'just jalepenos', description: 'jalapenos', chef_id: chef2.id)

      ingredient1 = Ingredient.create!(name: 'Mustard', calories: 5)
      ingredient2 = Ingredient.create!(name: 'Bun', calories: 100)
      ingredient3 = Ingredient.create!(name: 'Vegetarian hot dog', calories: 150)
      ingredient4 = Ingredient.create!(name: 'Jalapenos', calories: 50)

      dish_ingredient1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient1.id)
      dish_ingredient2 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient2.id)
      dish_ingredient3 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient3.id)
      dish_ingredient4 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient4.id)

      expect(chef2.all_ingredients).to eq([ingredient4])
      expect(chef1.all_ingredients).to eq([ingredient1, ingredient2, ingredient3])
    end
  end
end
