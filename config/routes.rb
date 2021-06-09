Rails.application.routes.draw do
  get 'searchs/serch'
  get 'relationships/create' => 'relationships#create'
  get 'relationship/destroy'
  get 'relationships/followers'
  get 'relationships/followings'
  root 'homes#top'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
   resource :relationships,only: [:create,:destroy]
   get 'relationships/followers' => 'relationships#followers', as: 'followers'
   get 'relationships/followings' => 'relationships#followings', as: 'followings'
  end

  get 'home/about' => 'homes#about'
  get '/homes' => 'users#show'
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'

  resources :books do
   resource :favorites,only: [:create,:destroy]
   resources :book_comments,only: [:create, :destroy]
  end



end