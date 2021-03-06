Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  root 'pages#index'
  get "pages/help"

  resources :users
  resources :topics do
   resources :comments
  end

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  # get 'comments/new'
  # post '/comments', to: 'comments#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
