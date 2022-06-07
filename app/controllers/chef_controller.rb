class ChefController < ApplicationController

  def show
    @chef = Chef.find(:chef_id])
    @ingredients = @chef.drygoods
  end
end