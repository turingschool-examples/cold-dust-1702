class ChefIngredientsController < ApplicationController
    def index
        @ingredients = Chef.find(params[:chef_id]).chef_ingredients
    end
end