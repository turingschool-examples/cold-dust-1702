require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "#chef_ingredients" do
    before :each do
        @chef = Chef.create(name: "Chef Boyardee")
        @chef2 = Chef.create(name: "Chef Ramsay")
        @dish = @chef.dishes.create(name: "Ravioli", description: "Cheap.")
        @dish2 = @chef.dishes.create(name: "Lasagna", description: "Also cheap.")
        @dish3 = @chef2.dishes.create(name: "Eggs", description: "Breakfast.")
        @ingredient = Ingredient.create(name: "Sodium", calories: 400)
        @ingredient2 = Ingredient.create(name: "Sauce", calories: 350)
        @ingredient3 = Ingredient.create(name: "Sugar", calories: 550)
        @ingredient4 = Ingredient.create(name: "Noodles", calories: 600)
        @ingredient5 = Ingredient.create(name: "Egg", calories: 80)
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient.id}")
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient2.id}")
        DishIngredient.create(dish_id: "#{@dish2.id}", ingredient_id: "#{@ingredient3.id}")
        DishIngredient.create(dish_id: "#{@dish2.id}", ingredient_id: "#{@ingredient4.id}")
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient4.id}")
        DishIngredient.create(dish_id: "#{@dish3.id}", ingredient_id: "#{@ingredient5.id}")
    end
    it 'returns all ingredients used by chef' do
      expect(@chef.chef_ingredients.to_a).to eq([@ingredient, @ingredient2, @ingredient3, @ingredient4])
    end
  end
end
