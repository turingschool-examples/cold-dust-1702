class ChefIngredients < ApplicationController
  def index
    @chef = Chef.find(params[:id])
  end
end
