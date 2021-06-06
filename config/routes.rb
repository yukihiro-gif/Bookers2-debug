Rails.application.routes.draw do
 # get 'favorites/create' => 'favorites#create'
  # get 'favorites/destroy'
  root 'homes#top'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  get 'home/about' => 'homes#about'
  get '/homes' => 'users#show'
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'

  resources :books do
   resource :favorites,only: [:create,:destroy]
   resources :book_comments,only: [:create, :destroy]
  end



end