Rails.application.routes.draw do
  resources :posts
  resources :user_friends
  devise_for :users
  get 'users', to: 'users#index'
  get 'user_friend', to: 'user_friend#index'
  post 'request_friend', to: 'user_friends#request_friend'
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
