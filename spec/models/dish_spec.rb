require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :ingredient_dishes }
    it { should have_many(:ingredients).through(:ingredient_dishes) }
  end

  describe 'instance methods' do
    let!(:chef) { Chef.create!(name:'Swedish Chef') }

    let!(:dish1) { chef.dishes.create!(name: 'Hot Dog Helper', description: 'similar to hamburger helper, but with hot dogs')}
    let!(:dish2) { chef.dishes.create!(name: 'Just Desserts', description: 'its a pile of sand, the chef was confused, apologies')}

    let!(:hotdog) {dish1.ingredients.create!(name: 'hot dogs', calories: 1000)}
    let!(:helper) {dish1.ingredients.create!(name: 'helper', calories: 5000)}
    let!(:beef) {dish1.ingredients.create!(name: 'beef', calories: 5)}
    let!(:sand) {dish2.ingredients.create!(name: 'sand', calories: 6)}

    it 'calculates dishes calorie count' do 
      expect(dish1.calorie_count).to eq(6005)
      expect(dish2.calorie_count).to eq(6)
    end
  end
end
