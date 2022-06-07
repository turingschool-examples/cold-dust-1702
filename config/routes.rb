Rails.application.routes.draw do

  resources :dishes, only: [:show]

  # resources :chefs, only: [:show] do
  #   resources :ingredients, only: [:index]
  # end

  resources :chefs, only: [:show]

  get "/chefs/:id/ingredients", to: 'ingredients#index'

end
