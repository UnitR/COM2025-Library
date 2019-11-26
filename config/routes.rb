Rails.application.routes.draw do
  
  # Application root
  root to: 'home#index'

  # User controller route configurationS
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Resources
  resources :books
  resources :forum_posts

  # Routes
  get '/home/index', to: 'home#index'
  get '/forum', to: 'forum_posts#index'

end
