Rails.application.routes.draw do
  devise_for :users
  
  root to: 'foods#index'
  
  # Creating the routes for the foods controller.
  resources :foods, only: [:index, :new, :create, :destroy] do
  end

  # Creating the routes for the recipes controller.
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
end
