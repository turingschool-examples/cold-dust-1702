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

  before :each do
    @chef1 = Chef.create!(name: "Boyardi")
    @chef2 = Chef.create!(name: "Mama Disalvo")
    @dish1 = @chef1.dishes.create!(name: "Spaghetti", description: "saucy boi")
    @noodle = Ingredient.create!(name: "Noodles", calories: "300")
    @sauce = Ingredient.create!(name: "Tomato Sauce", calories: "100")
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @noodle.id)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @sauce.id)
  end

  describe "instance methods " do

    it "can count #total_calories" do
      expect(@dish1.total_calories).to eq(400)
    end
  end
end
