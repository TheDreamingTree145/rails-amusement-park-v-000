Rails.application.routes.draw do
  root 'welcome#home'

  resources :users, only: [:index, :new, :create, :show]
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]

  patch '/ride', to: 'attractions#ride', as: 'ride'

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
