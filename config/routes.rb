Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]

  resources :password_resets,     only: [:new, :create, :edit, :update]
# GET	/password_resets/new	new	new_password_reset_path
# POST	/password_resets	create	password_resets_path
# GET	/password_resets/<token>/edit	edit	edit_password_reset_path(token)
# PATCH	/password_resets/<token>	update	password_reset_url(token)

  resources :microposts,          only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
