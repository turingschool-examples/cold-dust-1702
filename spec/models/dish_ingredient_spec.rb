require 'rails_helper'

RSpec.describe DishIngredient do
  it {should belong_to :dish}
  it {should belong_to :ingredient}
end
