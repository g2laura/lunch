Lunch::Application.routes.draw do

  get :menu, to: 'restaurants#menu'

  post 'order/:restaurant_id/:item_id', as: 'order', to: 'order#create', defaults: { format: :json }

  delete 'order/:restaurant_id/:item_id', as: 'remove_order', to: 'order#destroy', defaults: { format: :json }

  get 'order/user_orders', as: 'user_orders', to: 'order#user_orders', defaults: { format: :json }

  get 'order/restaurant_orders/:restaurant_id', as: 'lunch', to: 'order#restaurant_orders', defaults: { format: :pdf }

  resources :restaurants do
    get :vote, defaults: { format: :json }
    resources :items
  end

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks", sessions: 'users/sessions' }, path_prefix: 'session'

  resources :users

  root 'restaurants#index'

end
