Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  resources :cities, only: [:show]
  
  resources :users, only: [:show, :create,:new]

  resources :gossips do
    resources :comments, only: [:edit, :destroy, :new, :create, :update]
    resources :likes, only: [:create, :destroy]
  end

  # Pages statics et initialisation de la page root
  root 'gossips#index'
  get '/team',                to: 'statics#team'
  get '/contact',             to: 'statics#contact'
  get '/welcome/:first_name', to: 'statics#welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
