require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many :ingredients }
  end

  describe 'instance methods' do
    let!(:chef) { Chef.create!(name: 'Remy') }

    let!(:dish) { chef.dishes.create!(name: 'Salad', description: 'Green and leafy!') }

    let!(:ingredient1) { Ingredient.create!(name: 'Kale', calories: 100) }
    let!(:ingredient2) { Ingredient.create!(name: 'Tomato', calories: 50) }

    let!(:dish_ingredient1) { DishIngredient.create!(dish: dish, ingredient: ingredient1) }
    let!(:dish_ingredient2) { DishIngredient.create!(dish: dish, ingredient: ingredient2) }

    it 'calculates total calories for a dish' do
      expect(dish.total_calorie_count).to eq(150)
    end
  end
end
