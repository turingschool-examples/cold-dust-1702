Rails.application.routes.draw do
  resources :dishes, only: %i[show]

  resources :chefs, only: %i[show] do
    resources :ingredients, controller: :chef_ingredients, only: %i[index]
  end
end
