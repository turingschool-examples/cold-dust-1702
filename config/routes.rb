Rails.application.routes.draw do
  resources :dishes, only: %i[show]
end
