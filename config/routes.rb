Rails.application.routes.draw do
  devise_for :users
  
  root to: 'foods#index'
  
  resources :foods, only: [:index, :new, :create, :destroy] do
  end

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:index, :new, :create, :destroy]
  end

  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
