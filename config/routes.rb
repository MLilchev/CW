Rails.application.routes.draw do

  resources :books, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]


  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :users, only: [:new, :create]

  resources :user_sessions, only: [:create, :destroy]

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
  get 'password_resets/new', to: 'password_resets#create'
  get 'user_sessions/:id', to: 'user#show'
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  get 'user_sessions/user_session_params', to: 'user#show'
  resources :users
  root to: 'welcome#index'
  get 'welcome/about'
  #resources :heatmap, only: [:index]
  get 'datatable/index'
  get 'datatable/show'
  get 'heatmap/index'
  resources :books
  get 'pinmap/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/visualisation/index'
  get 'pinmap/:id', to: 'pinmap#show'
  get 'api/country', to: 'api#country'
  get 'api/conflict', to: 'api#conflict'
  get 'api/clash', to: 'api#clash'
end
