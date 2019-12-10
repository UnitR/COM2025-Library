Rails.application.routes.draw do
  
  # Application root
  root to: 'home#index'

  # User controller route configuration
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  # Resources
  resources :books
  resources :forum_posts

  # ----- GET method routes ----- 
  
  # Home controller
  get '/', to: 'home#index'
  get '/home', to: 'home#index'
  get '/home/index', to: 'home#index'

  # Forum controller
  get '/forum', to: 'forum_posts#index'
  get '/books', to: 'books#index'

end
