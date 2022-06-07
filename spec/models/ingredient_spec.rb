require 'rails_helper'

RSpec.describe Ingredient do
  describe 'relationships' do
    it { should have_many :dishes }
  end
end
