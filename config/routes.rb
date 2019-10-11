Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "ranking#index"
  get "/ranking", to: "ranking#index"

  resources :users
  resources :matches, only: [ :index, :new, :create ]
  resources :teams, only: [ :index, :new, :create ] 

end
