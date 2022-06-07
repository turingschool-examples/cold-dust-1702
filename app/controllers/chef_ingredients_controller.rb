class ChefIngredientsController < ApplicationController
  def index
    @ingredients = Chef.joins(:ingredients)
                       .where("chefs.id = #{params[:id]}")
                       .pluck('ingredients.name')
                       .uniq
  end
end
