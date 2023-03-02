Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  devise_for :users
  root to: "posts#index"

  resources :posts do
    resources :likes
    resources :comments do 
      resources :comments
    end

    get'profile', to: 'posts#profile', on: :collection
  end

  #  resources :comments do
  #   resources :comments
  # end
  
  delete '/posts/:id', to: 'posts#destroy', as: 'delete_post'


end
