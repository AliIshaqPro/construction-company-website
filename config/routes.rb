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
  get 'tiles-calculator', to: 'home#tiles'
  get 'hardcore-calculator', to: 'home#hardcore'
  get 'concrete-calculator', to: 'home#concrete'
  get 'bricks-calculator', to: 'home#bricks'
  get 'paint-calculator', to: 'home#paint'
  get 'loft-insulation-calculator', to: 'home#loft'
  get 'services', to: 'home#services'

  get 'faq', to: 'home#faq'
  get 'service-details', to: 'home#servicedetails'
  get 'careers', to: 'home#careers'
  get 'appointment', to: 'home#appointment'
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
    resources :faqs, except: [:show]
  end

  resources :faqs, only: [:index]


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
