Rails.application.routes.draw do
  
  # Application root
  root to: 'home#index'

  # User controller route configuration
  devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Resources
  resources :books
  resources :forum_posts
  
end
