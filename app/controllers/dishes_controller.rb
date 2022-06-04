class DishesController < ApplicationController

  def show 
    @chef = Chef.find(params[:id])
    @dish = @chef.dishes.find(params[:id])
  end
end