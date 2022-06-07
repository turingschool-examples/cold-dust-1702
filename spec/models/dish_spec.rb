require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it { should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "#calorie_count" do
     before :each do
        @chef = Chef.create(name: "Chef Boyardee")
        @chef2 = Chef.create(name: "Chef Ramsay")
        @dish = @chef.dishes.create(name: "Ravioli", description: "Cheap.")
        @dish2 = @chef.dishes.create(name: "Lasagna", description: "Also cheap.")
        @ingredient = Ingredient.create(name: "Sodium", calories: 400)
        @ingredient2 = Ingredient.create(name: "Sauce", calories: 350)
        @ingredient3 = Ingredient.create(name: "Sugar", calories: 550)
        @ingredient4 = Ingredient.create(name: "Noodles", calories: 600)
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient.id}")
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient2.id}")
        DishIngredient.create(dish_id: "#{@dish2.id}", ingredient_id: "#{@ingredient3.id}")
        DishIngredient.create(dish_id: "#{@dish2.id}", ingredient_id: "#{@ingredient4.id}")
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient4.id}")
    end
    
    it 'should add up calories from ingredients and return total' do
      expect(@dish.calorie_count).to eq(1350)
      expect(@dish2.calorie_count).to eq(1150)
    end
  end
end
