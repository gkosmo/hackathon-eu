Rails.application.routes.draw do
  
  resources :follows
  get 'widgets/show'
  resources :problems do
    member do 
      post 'upvote'
      post 'downvote'
    end
    resources :comments    
    resources :tags, only: [:index, :show , :destroy]
    resources :follows, only: [:create, :destroy]
  end
  resources :comments, only: [] do
    member do 
      post 'upvote'
      post 'downvote'
    end
  end
  resources :categories
  devise_for :users
  root to: 'problems#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get 'analytics', to: "pages#analytics"
  
  get '/widgets/:template', to: 'widgets#show'

end
