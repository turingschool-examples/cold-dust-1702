require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :dishes }
  end
  describe 'instance methods' do
    let!(:chef) { Chef.create!(name: 'Remy') }

    let!(:dish) { chef.dishes.create!(name: 'Salad', description: 'Green and leafy!') }
    let!(:dish2) { chef.dishes.create!(name: 'Soup', description: 'Soup of the day!') }
    let!(:dish3) { chef.dishes.create!(name: 'Sandwich', description: 'Two pieces of bread and some other stuff') }

    let!(:ingredient1) { Ingredient.create!(name: 'Kale', calories: 100) }
    let!(:ingredient2) { Ingredient.create!(name: 'Tomato', calories: 50) }
    let!(:ingredient3) { Ingredient.create!(name: 'Mushroom', calories: 150) }
    let!(:ingredient4) { Ingredient.create!(name: 'Bread', calories: 120) }

    let!(:dish_ingredient1) { DishIngredient.create!(dish: dish, ingredient: ingredient1) }
    let!(:dish_ingredient2) { DishIngredient.create!(dish: dish, ingredient: ingredient2) }
    let!(:dish_ingredient8) { DishIngredient.create!(dish: dish, ingredient: ingredient3) }
    let!(:dish_ingredient3) { DishIngredient.create!(dish: dish2, ingredient: ingredient3) }
    let!(:dish_ingredient4) { DishIngredient.create!(dish: dish2, ingredient: ingredient2) }
    let!(:dish_ingredient5) { DishIngredient.create!(dish: dish3, ingredient: ingredient4) }
    let!(:dish_ingredient6) { DishIngredient.create!(dish: dish3, ingredient: ingredient2) }
    let!(:dish_ingredient7) { DishIngredient.create!(dish: dish3, ingredient: ingredient1) }
    it 'can list chefs 3 most popular ingredients' do
      expect(chef.three_most_popular_ingredients).to eq(%w[Tomato Kale Mushroom])
    end
  end
end
