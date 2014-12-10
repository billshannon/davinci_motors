Rails.application.routes.draw do
  default_url_options host: 'localhost', port: 3000
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'cars#index'

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  delete '/logout',
         to: 'sessions#destroy'
  get 'verification/:token', to: 'users#verify', as: 'verify_email'

  resources :cars

  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup' }

end
