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
    before(:each) do
      @chef1 = Chef.create!(name: 'Cory')
      @chef2 = Chef.create!(name: 'Kyle')

      @dish1 = @chef1.dishes.create!(name: "Pizza", description: 'I love it.')
      @dish2 = @chef1.dishes.create!(name: "Pasta", description: 'I kinda love it.')
      @dish3 = @chef2.dishes.create!(name: "Collard Greens", description: 'I hate it.')
      @dish4 = @chef2.dishes.create!(name: "Chives", description: 'I kinda hate it.')

      @ingredient1 = Ingredient.create!(name: 'Pepperoni', calories: 200)
      @ingredient2 = Ingredient.create!(name: 'Cheese', calories: 20)
      @ingredient3 = Ingredient.create!(name: 'Leafy Greens', calories: 10)
      @ingredient4 = Ingredient.create!(name: 'Green Onion', calories: 100)

      @di1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
      @di2 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient2.id)
      @di3 = DishIngredient.create!(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
      @di4 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient4.id)
    end

    it "#the_chef" do
      expect(@dish1.the_cook).to eq('Cory')
      expect(@dish3.the_cook).to eq('Kyle')
    end
  end
end
