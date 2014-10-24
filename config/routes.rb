Lunch::Application.routes.draw do

  get :menu, to: 'restaurants#menu'

  resources :restaurants do
    get :vote, defaults: {format: :json}
    resources :items
  end

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }, path_prefix: 'session'

  resources :users

  root 'restaurants#index'

end
