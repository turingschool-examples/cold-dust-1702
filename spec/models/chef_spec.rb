require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many :dishes}
    it { should have_many(:ingredients).through(:dishes)}
  end

  describe '#instance methods' do
    let!(:chef1) {Chef.create(name: "Chef Boy R Dee")}
    let!(:chef2) {Chef.create(name: "Gordon Ramsay")}

    let!(:dish1) {chef1.dishes.create(name: "Macaroni and Cheese", description: "Delicious pasta and cheese")}
    let!(:dish2) {chef2.dishes.create(name: "Beef Wellington", description: "Medium Rare Beef with a bread cover")}

    let!(:ingredient1) {dish1.ingredients.create(name: "Pasta", calories: 400)}
    let!(:ingredient2) {dish1.ingredients.create(name: "Cheese", calories: 300)}
    let!(:ingredient5) {dish1.ingredients.create(name: "Cheese", calories: 300)}
    let!(:ingredient3) {dish2.ingredients.create(name: "Beef", calories: 250)}
    let!(:ingredient4) {dish2.ingredients.create(name: "Bread", calories: 600)}

    it "can create a distinct list of that chefs ingredients" do

      expect(chef1.unique_ingredients).to eq([ingredient2.name, ingredient1.name])

    end

  #   describe 'extension' do
  #     let!(:dish3) {chef1.dishes.create(name: "Stuff Potato", description: "Its a potateo.... stuffed with stuff")}
  #     let!(:dish4) {chef1.dishes.create(name: "Lasenga", description: "Garfields Favorite")}
  #     let!(:dish5) {chef1.dishes.create(name: "Spagehetti", description: "Romantic food with meatballs")}
  #     let!(:ingredient5) {dish3.ingredients.create(name: "Cheese", calories: 300)}
  #     let!(:ingredient6) {dish3.ingredients.create(name: "Potato", calories: 400)}
  #     let!(:ingredient7) {dish3.ingredients.create(name: "Sour Cream", calories: 400)}
  #     let!(:ingredient8) {dish4.ingredients.create(name: "Cheese", calories: 300)}
  #     let!(:ingredient9) {dish4.ingredients.create(name: "Pasta", calories: 400)}
  #     let!(:ingredient10) {dish5.ingredients.create(name: "Pasta", calories: 400)}
  #     let!(:ingredient11) {dish5.ingredients.create(name: "Sour Cream", calories: 400)}
  #     let!(:ingredient12) {dish5.ingredients.create(name: "Cheese", calories: 300)}
  #     let!(:ingredient13) {dish5.ingredients.create(name: "Meatballs", calories: 650)}
  #
  #     it "can list the chefs three favorite ingredients" do
  #
  #         expect(chef1.three_most_popular).to eq(["Cheese, Pasta, Sour Cream"])
  #
  #     end
  #   end
  end
end
