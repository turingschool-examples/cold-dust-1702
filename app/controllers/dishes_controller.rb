class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    # binding.pry
  end
end
