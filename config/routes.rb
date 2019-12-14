Rails.application.routes.draw do
  
  # Application root
  root to: 'home#index'

  # User controller route configuration
  devise_for :users, path: '', path_names: { 
    sign_in: 'login',
    sign_out: 'logout', 
    sign_up: 'register'
  }

  # Resources
  resources :books

  # ----- GET method routes ----- 
  
  # Home controller
  get '/', to: 'home#index'
  get '/home', to: 'home#index'
  get '/home/index', to: 'home#index'

  # Contact controller
  get '/contact', to: 'contact#index'
  get '/contact/index', to: 'contact#index'
  
  # ----- POST method routes ----- 
  post '/contact', to: 'contact#send_request'

end
