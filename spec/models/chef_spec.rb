require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "methods" do
       before(:each) do
      @chef1 = Chef.create!(name: "Cliff")
      @dish1 = @chef1.dishes.create!(name: "chicken", description: "good")
      @dish3 = @chef1.dishes.create!(name: "beef", description: "great")

      @ingredient1 = Ingredient.create!(name: "ginger", calories: 1)
      @ingredient2 = Ingredient.create!(name: "sporty", calories: 10)
      @ingredient3 = Ingredient.create!(name: "posh", calories: 20)
      @ingredient4 = Ingredient.create!(name: "scary", calories: 30)
      @ingredient5 = Ingredient.create!(name: "baby", calories: 40)
      @ingredient6= Ingredient.create!(name: "old", calories: 100)

      @dishes_ingredient1 = @ingredient1.dishes_ingredients.create!(dish_id: @dish1.id)
      @dishes_ingredient2 = @ingredient2.dishes_ingredients.create!(dish_id: @dish1.id)
      @dishes_ingredient5 = @ingredient5.dishes_ingredients.create!(dish_id: @dish3.id)
      @dishes_ingredient6 = @ingredient6.dishes_ingredients.create!(dish_id: @dish3.id)
      @dishes_ingredient9 = @ingredient3.dishes_ingredients.create!(dish_id: @dish3.id)
      @dishes_ingredient11 = @ingredient6.dishes_ingredients.create!(dish_id: @dish1.id)
       end

    it "returns a unique of ingredients used by chef" do
      expect(@chef1.drygoods).to match_array([@ingredient1, @ingredient2, @ingredient3, @ingredient5, @ingrediant6])
    end
  end
end
