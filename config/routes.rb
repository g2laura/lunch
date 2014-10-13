Lunch::Application.routes.draw do

  resources :items

  resources :menus

  resources :restaurants do
    get :vote, defaults: {format: :json}
  end

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  root 'restaurants#index'

end
