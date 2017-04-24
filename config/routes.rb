CmsApp2::Application.routes.draw do
  

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :products
  resources :categories
  get '/index' => 'pages#index'
  get '/signup' => 'users#new'
  get 'make_admin/:id' => 'users#make_admin', as: 'make_admin'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  root 'pages#index'
  
end
