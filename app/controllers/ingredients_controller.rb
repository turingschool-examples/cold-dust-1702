class IngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:id])
    @ingredients = @chef.unique_ingredients
  end
end
