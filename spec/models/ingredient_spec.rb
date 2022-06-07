require 'rails_helper'

RSpec.describe Ingredient, type: :model do
    describe 'relationships' do
    it {should have_many(:dishes_ingredients) }
    it {should have_many(:dishes).through(:dishes_ingredients)}
  end
end
