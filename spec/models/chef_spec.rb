require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
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

    it 'can display all ingredients' do
      expect(@jimbob.all_ingredients[0].name).to eq("Garlic Butter Croutons")
      expect(@jimbob.all_ingredients[1].name).to eq("Light Floral Vinaigrette")
      expect(@jimbob.all_ingredients[2].name).to eq("Mozzarella")
      expect(@jimbob.all_ingredients[3].name).to eq("Pasta")
      expect(@jimbob.all_ingredients[4].name).to eq("Romaine Lettuce")
      expect(@jimbob.all_ingredients[5].name).to eq("Tomato Sauce")
      expect(@jimbob.all_ingredients[6]).to eq(nil)
    end

    it 'will not repeat ingredients if used more than once' do
      dish_ingredient7 = @salad.dish_ingredients.create!(ingredient_id: @cheese.id)
      expect(@jimbob.all_ingredients[0].name).to eq("Garlic Butter Croutons")
      expect(@jimbob.all_ingredients[1].name).to eq("Light Floral Vinaigrette")
      expect(@jimbob.all_ingredients[2].name).to eq("Mozzarella")
      expect(@jimbob.all_ingredients[3].name).to eq("Pasta")
      expect(@jimbob.all_ingredients[4].name).to eq("Romaine Lettuce")
      expect(@jimbob.all_ingredients[5].name).to eq("Tomato Sauce")
      expect(@jimbob.all_ingredients[6]).to eq(nil)
    end
  end
end
