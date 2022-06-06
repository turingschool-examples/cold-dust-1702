require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :dishes }
    it { should have_many :ingredients }
  end
  describe 'behaviors' do
    it 'Can list the three most popular ingredients' do
      chef = Chef.create!(name: 'Alfonso')
      dish1 = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
      dish2 = chef.dishes.create!(name: 'Poorly Made Pizza', description: 'You said, "No cheese." right?')
      dish3 = chef.dishes.create!(name: 'From the Dumpster, With Love', description: 'Waste not, want not.')
      dish = chef.dishes.create!(name: 'Sorry Salad', description: 'I am so sorry I made this.')
      lettuce = Ingredient.create!(name: 'lettuce', calories: 0)
      tears = Ingredient.create!(name: 'tears', calories: 12)
      gluten_free_croutons = Ingredient.create!(name: 'Gluten-Free Croutons', calories: 129)
      pepperoni = Ingredient.create!(name: 'Pepperoni', calories: 129)
      volkswagen = Ingredient.create!(name: 'VW Bug', calories: 12_129)
      yesterdays_special = Ingredient.create!(name: "Today's Special", calories: 1129)
      pineapple = Ingredient.create!(name: 'Pineapple', calories: 129)

      # =========== DISH1 Ingredients ===========
      DishIngredient.create!(dish_id: dish1.id, ingredient_id: lettuce.id)
      DishIngredient.create!(dish_id: dish1.id, ingredient_id: tears.id)
      DishIngredient.create!(dish_id: dish1.id, ingredient_id: gluten_free_croutons.id)

      # =========== DISH2 Ingredients ===========
      DishIngredient.create!(dish_id: dish2.id, ingredient_id: lettuce.id)
      DishIngredient.create!(dish_id: dish2.id, ingredient_id: tears.id)
      DishIngredient.create!(dish_id: dish2.id, ingredient_id: pineapple.id)
      DishIngredient.create!(dish_id: dish2.id, ingredient_id: yesterdays_special.id)

      # =========== DISH3 Ingredients ===========
      DishIngredient.create!(dish_id: dish3.id, ingredient_id: lettuce.id)
      DishIngredient.create!(dish_id: dish3.id, ingredient_id: tears.id)
      DishIngredient.create!(dish_id: dish3.id, ingredient_id: volkswagen.id)
      DishIngredient.create!(dish_id: dish3.id, ingredient_id: pineapple.id)

      expect(chef.popular_ingredients).to match_array([lettuce, tears, pineapple])
    end
  end
end
