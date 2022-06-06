require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe 'instance methods' do
    before do
      @chef = Chef.create!(name: "Rob")

      dish1 = @chef.dishes.create!(name: "Pancakes", description: "Stack of 3 fluffy pancakes")
      dish2 = @chef.dishes.create!(name: "Omelette", description: "Served with home fries")

      milk = Ingredient.create!(name: "milk", calories: 90)
      flour = Ingredient.create!(name: "flour", calories: 60)
      eggs = Ingredient.create!(name: "eggs", calories: 80)
      potatoes = Ingredient.create!(name: "potatoes", calories: 100)

      DishIngredient.create!(dish: dish1, ingredient: milk)
      DishIngredient.create!(dish: dish1, ingredient: flour)
      DishIngredient.create!(dish: dish1, ingredient: eggs)
      DishIngredient.create!(dish: dish2, ingredient: eggs)
      DishIngredient.create!(dish: dish2, ingredient: potatoes)
    end

    describe 'unique_ingredients' do
      it 'returns a list of all ingredients used by a chef' do
        expect(@chef.unique_ingredients).to match_array(["milk", "flour", "eggs", "potatoes"])
      end
    end

  end
end
