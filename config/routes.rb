Rails.application.routes.draw do
  # Set the admin index as the root path
  #root 'admin#index'
  get 'dashboard', to: 'admin#index'
  get 'about', to: 'home#about'
  get 'projects', to: 'home#projects'
  get 'services', to: 'home#services'
  get 'contact', to: 'home#contact'
  root 'home#home'
  # config/routes.rb
devise_for :admins

  namespace :admin do
    resources :projects
    resources :clients
    resources :feedbacks
  end
  
end
