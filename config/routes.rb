Rails.application.routes.draw do
  root to: 'landings#index'
  resources :articles
  get '/user/:id' => 'users#show', as: :show_user
  put '/user/:id/avatar' => 'users#update_avatar', as: :update_avatar

  post '/articles/:id/like' => 'like_relation_ships#create', as: :create_like
  delete '/articles/:id/like' => 'like_relation_ships#destroy', as: :delete_like

  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create]

  devise_for :users
end
