class ChefIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:id])
    @ingredients = @chef.ingredients
  end
end
