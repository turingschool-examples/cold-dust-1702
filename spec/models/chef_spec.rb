require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    before :each do
      @chef1 = Chef.create!(name: "Bob")
      @chef2 = Chef.create!(name: "Joe")

      @dish1 = Dish.create!(name: 'soup', description: 'soupy', chef_id: @chef1.id)
      @dish2 = Dish.create!(name: 'ham and cheese', description: 'cheesy', chef_id: @chef2.id)
      @dish3 = Dish.create!(name: 'steak', description: 'bloody', chef_id: @chef1.id)
      @dish4 = Dish.create!(name: 'steak sandwich', description: 'bloody sandwich', chef_id: @chef1.id)

      @ing1 = Ingredient.create!(name: "swiss cheese", calories: "100")
      @ing2 = Ingredient.create!(name: "pork", calories: "200")
      @ing3 = Ingredient.create!(name: "broth", calories: "300")
      @ing4 = Ingredient.create!(name: "beef", calories: "400")
      @ing5 = Ingredient.create!(name: "potatoes", calories: "100")
      @ing6 = Ingredient.create!(name: "salt", calories: "100")
      @ing7 = Ingredient.create!(name: "pepper", calories: "300")
      @ing8 = Ingredient.create!(name: "bread", calories: "400")

      @dish2.dish_ingredients.create!(ingredient_id: @ing1.id)
      @dish2.dish_ingredients.create!(ingredient_id: @ing2.id)
      @dish1.dish_ingredients.create!(ingredient_id: @ing4.id)
      @dish1.dish_ingredients.create!(ingredient_id: @ing3.id)
      @dish3.dish_ingredients.create!(ingredient_id: @ing5.id)
      @dish3.dish_ingredients.create!(ingredient_id: @ing6.id)
      @dish3.dish_ingredients.create!(ingredient_id: @ing7.id)
      @dish3.dish_ingredients.create!(ingredient_id: @ing8.id)
      @dish1.dish_ingredients.create!(ingredient_id: @ing8.id)
      @dish4.dish_ingredients.create!(ingredient_id: @ing8.id)
      @dish4.dish_ingredients.create!(ingredient_id: @ing6.id)
      @dish4.dish_ingredients.create!(ingredient_id: @ing4.id)
    end

    it "#top_3_ingredients" do
      expect(@chef1.top_3_ingredients).to eq([@ing8, @ing4, @ing6])
    end
  end
end
