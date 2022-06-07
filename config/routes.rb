Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dish, only: [:show] do
  end

  resources :chef, only: [:show] do
    resources :ingredient, only: [:index] 
  end

  get "dish/:id", to: 'dish#show'  #  LEFT HERE INTENTIONALLY FOR LATER ActionController::RoutingError   No route matches [GET] "/dish/112"
  get "chef/:id/ingredient", to: "ingredient#index"
end