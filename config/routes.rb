Rails.application.routes.draw do
  resources :comments
  resources :problems
  resources :categories
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :problems
resources :tags, only: [:index, :show]

end
