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
      @jimbob = Chef.create!(name: "Jimbob Dudeguy")
      @spaghetti = @jimbob.dishes.create!(name: "Spaghetti", description: "Wholesome ol' carbs, tomato, and cheese")
      @noodle = Ingredient.create!(name: "Pasta", calories: 500)
      @sauce = Ingredient.create!(name: "Tomato Sauce", calories: 85)
      @cheese = Ingredient.create!(name: "Mozzarella", calories: 265)

      @salad = @jimbob.dishes.create!(name: "Dinner Salad", description: "A lighter dinner option, with a lovely floral dressing")

      @lettuce = Ingredient.create!(name: "Romaine Lettuce" , calories: 70)
      @vinaigrette = Ingredient.create!(name: "Light Floral Vinaigrette" , calories: 90)
      @croutons = Ingredient.create!(name: "Garlic Butter Croutons" , calories: 150)

      dish_ingredient1 = @spaghetti.dish_ingredients.create!(ingredient_id: @noodle.id)
      dish_ingredient2 = @spaghetti.dish_ingredients.create!(ingredient_id: @sauce.id)
      dish_ingredient3 = @spaghetti.dish_ingredients.create!(ingredient_id: @cheese.id)

      dish_ingredient4 = @salad.dish_ingredients.create!(ingredient_id: @lettuce.id)
      dish_ingredient5 = @salad.dish_ingredients.create!(ingredient_id: @vinaigrette.id)
      dish_ingredient6 = @salad.dish_ingredients.create!(ingredient_id: @croutons.id)
    end
    it 'total_cal returns the sum of all calories in a dish' do
      expect(@spaghetti.total_cal).to eq(850)
      expect(@salad.total_cal).to eq(310)
    end
  end
end
