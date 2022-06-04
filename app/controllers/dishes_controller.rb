class DishesController < ApplicationController

  def show 
    @chef = Chef.find(params[:chef_id])
    @dish = @chef.dishes.find(params[:id])
  end
end