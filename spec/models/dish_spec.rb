require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    it 'counts calories for each dish' do
      wolfgang = Chef.create!(name: "Wolfgang Puck")

      spaghetti = wolfgang.dishes.create!(name: "Spaghetti", description: "Red sauce and meatballs")

      pasta = Ingredient.create!(name: "Pasta noodles", calories: 300)
      tomatoes = Ingredient.create!(name: "Tomatoes", calories: 25)

      DishIngredient.create!(dish: spaghetti, ingredient: pasta)
      DishIngredient.create!(dish: spaghetti, ingredient: tomatoes)
      
      expect(spaghetti.calorie_count).to eq(325)
    end
  end
end
