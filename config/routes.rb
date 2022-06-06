Rails.application.routes.draw do
  resources :dishes, only: %i[show]

  resources :chefs, only: %i[show]
end
