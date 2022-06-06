class Chef::IngredientsController < ApplicationController

  def index
    chef = Chef.find(params[:chef_id])
    @ingredients = chef.used_ingredients
  end
end
