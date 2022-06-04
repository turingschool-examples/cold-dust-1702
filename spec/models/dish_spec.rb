require 'rails_helper'

RSpec.describe Dish, type: :model do
    let!(:chef_1) {Chef.create!(name: "Boyardee")}
  let!(:dish_1) {chef_1.dishes.create!(name: "Raveoli" , description: "delicious" )}
  let!(:ingredient_1) {dish_1.ingredients.create!(name: "cheese", calories: 234)}
  let!(:ingredient_2) {dish_1.ingredients.create!(name: "flour", calories: 100)}

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  it 'can calculate total calories for dish' do 

    expect(dish_1.total_calories).to eq(334)
  end
end
