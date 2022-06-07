class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
    @top_ingredients = @chef.popular_ingredients
  end
end
