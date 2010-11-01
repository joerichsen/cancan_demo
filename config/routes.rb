CancanDemo::Application.routes.draw do

  devise_for :users

  resources :products
  resources :user do
    resources :products
  end

  root :to => "products#index"
end
