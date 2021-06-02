Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  get 'home/about' => 'homes#about'
  get '/homes' => 'users#show'
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'
end