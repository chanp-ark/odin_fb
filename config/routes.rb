Rails.application.routes.draw do
  resources :posts do
    resources :comments, module: :posts
  end
  resources :user_friends
  devise_for :users
  get 'users', to: 'users#index'
  get 'user_friend', to: 'user_friend#index'
  post 'request_friend', to: 'user_friends#request_friend'
  put 'like_post', to: 'posts#like_post'
  root to: 'home#index'
end
