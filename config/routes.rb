Rails.application.routes.draw do
  root to: 'landings#index'

  get '/explore' => 'landings#explore', as: :explore_page

  resources :articles
  get '/user/:id' => 'users#show', as: :show_user
  put '/user/:id/avatar' => 'users#update_avatar', as: :update_avatar

  post '/articles/:id/like' => 'like_relation_ships#create', as: :create_like
  delete '/articles/:id/like' => 'like_relation_ships#destroy', as: :delete_like

  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create]

  get '/user/:id/relationships' => 'relationships#show', as: :show_relationships

  devise_for :users
end
