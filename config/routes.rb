Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dishes, only: %i[show]

  resources :chefs, only: %i[show] do
    resources :ingredients, only: %[index]
  end
end
