class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @chef = @dish.chef
  end
end
