require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end
  describe 'instance methods' do
    before :each do
      @chef1 = Chef.create!(name: "Bob")
      @chef2 = Chef.create!(name: "Joe")

      @dish1 = Dish.create!(name: 'soup', description: 'soupy', chef_id: @chef1.id)
      @dish2 = Dish.create!(name: 'ham and cheese', description: 'cheesy', chef_id: @chef2.id)

      @ing1 = Ingredient.create!(name: "swiss cheese", calories: "100")
      @ing2 = Ingredient.create!(name: "pork", calories: "200")
      @ing3 = Ingredient.create!(name: "broth", calories: "300")
      @ing4 = Ingredient.create!(name: "beef", calories: "400")

      @dish2.dish_ingredients.create!(ingredient_id: @ing1.id)
      @dish2.dish_ingredients.create!(ingredient_id: @ing2.id)
      @dish1.dish_ingredients.create!(ingredient_id: @ing4.id)
      @dish1.dish_ingredients.create!(ingredient_id: @ing3.id)

    end
    it "returns the sum of calories" do
      expect(@dish1.calorie_count).to eq(700)
    end
  end

end
