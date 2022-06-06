require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  let!(:chef2) { Chef.create!(name: 'Bob')}

  let!(:warmest_color) {chef2.dishes.create!(name: 'blue is the warmest cheese', description: 'a blue cheese burger')}
  let!(:kraut_down) {chef2.dishes.create!(name: 'the final kraut down', description: 'a polish sausage with kraut')}

  let!(:sand) {Ingredient.create!(name: 'sand', calories: 6)}
  let!(:beef) {Ingredient.create!(name: 'beef', calories: 5)}
  let!(:blue) {Ingredient.create!(name: 'blue cheese', calories: 100)}
  let!(:bbq) {Ingredient.create!(name: 'barbeque sauce', calories: 20)}
  let!(:bun) {Ingredient.create!(name: 'bun', calories: 10000)}
  let!(:spicy_mustard) {Ingredient.create!(name: 'spicy mustard', calories: 5000)}
  let!(:hot_kraut) {Ingredient.create!(name: 'sour kraut', calories: 5000)}
  let!(:kielbasa) {Ingredient.create!(name: 'kielbasa sausage', calories: 5000)}
  let!(:pickles) {Ingredient.create!(name: 'pickles', calories: 10)}

  let!(:ingredient_dish1) {IngredientDish.create!(dish: warmest_color, ingredient: beef)}
  let!(:ingredient_dish2) {IngredientDish.create!(dish: warmest_color, ingredient: blue)}
  let!(:ingredient_dish3) {IngredientDish.create!(dish: warmest_color, ingredient: bbq)}
  let!(:ingredient_dish4) {IngredientDish.create!(dish: warmest_color, ingredient: bun)}
  let!(:ingredient_dish5) {IngredientDish.create!(dish: warmest_color, ingredient: pickles)}

  let!(:ingredient_dish6) {IngredientDish.create!(dish: kraut_down, ingredient: bun)}
  let!(:ingredient_dish7) {IngredientDish.create!(dish: kraut_down, ingredient: spicy_mustard)}
  let!(:ingredient_dish8) {IngredientDish.create!(dish: kraut_down, ingredient: hot_kraut)}
  let!(:ingredient_dish9) {IngredientDish.create!(dish: kraut_down, ingredient: kielbasa)}
  let!(:ingredient_dish10) {IngredientDish.create!(dish: kraut_down, ingredient: pickles)}

  describe 'instance methods' do 
    it 'returns one of each ingredient' do 
      expect(chef2.no_duplicates).to eq([beef, blue, bbq, bun, spicy_mustard, hot_kraut, kielbasa, pickles])
      expect(chef2.no_duplicates).to_not eq([beef, blue, bbq, bun, pickles, bun, spicy_mustard, hot_kraut, kielbasa, pickles])
      expect(chef2.no_duplicates).to_not include(sand)
    end
  end
end
