require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
  describe 'relationships' do
    it { should belong_to :chef }
  end
  describe 'behaviors' do
    it 'can show total calorie count for the dish' do
      chef = Chef.create!(name: 'Alfonso')
      dish = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
      lettuce = Ingredient.create!(name: 'lettuce', calories: 0)
      tears = Ingredient.create!(name: 'tears', calories: 12)
      gluten_free_croutons = Ingredient.create!(name: 'Gluten-Free Croutons', calories: 129)
      DishIngredient.create!(dish_id: dish.id, ingredient_id: lettuce.id)
      DishIngredient.create!(dish_id: dish.id, ingredient_id: tears.id)
      DishIngredient.create!(dish_id: dish.id, ingredient_id: gluten_free_croutons.id)

      expect(dish.total_cals).to eq(141)
    end
  end
end
