Lunch::Application.routes.draw do

  resources :items

  resources :categories

  resources :menus

  resources :restaurants

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  root 'dashboard#index'

end
