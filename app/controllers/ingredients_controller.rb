class IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])
    binding.pry
  end
end
