class IngredientsController < ApplicationController
  def index
    chef = Chef.find(params[:chef_id])
    @ingredients = chef.ingredients.select('ingredients.name').group(:name)
  end
end
