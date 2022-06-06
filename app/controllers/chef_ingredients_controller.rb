class ChefIngredientsController < ApplicationController
  def index
    require 'pry'
    binding.pry
    @ingredients = Chef.find(params[:id]).ingredients
  end
end
