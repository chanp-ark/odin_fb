Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'users', to: 'users#index'
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
