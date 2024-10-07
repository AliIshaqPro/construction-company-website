Rails.application.routes.draw do
  namespace :admin do
    get "consultation_requests/index"
  end
  get "consultation_requests/new"
  get "consultation_requests/create"
  # Set the admin index as the root path
  #root 'admin#index'
  get 'dashboard', to: 'admin#index'
  get 'about', to: 'home#about'
  get 'projects', to: 'home#projects'
  get 'services', to: 'home#services'
  get 'contact', to: 'home#contact'
  root 'home#home'
  post '/', to: 'home#create'
  resources :newsletters, only: [:create]
  resources :consultation_requests, only: [:new, :create] 
  namespace :admin do
    resources :consultation_requests, only: [:index] # Add other actions as needed
  end
  # config/routes.rb

namespace :admin do
  resources :subscriptions
end

  # config/routes.rb
devise_for :admins

  namespace :admin do
    resources :projects
    resources :clients
    resources :feedbacks
  end
  
end
