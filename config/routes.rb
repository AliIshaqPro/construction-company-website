Rails.application.routes.draw do
  # Set the admin index as the root path
  #root 'admin#index'
  get 'dashboard', to: 'admin#index'
  root 'home#home'
  # config/routes.rb
devise_for :admins

  namespace :admin do
    resources :projects
    resources :clients
    resources :feedbacks
  end
  
end
