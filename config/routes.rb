Rails.application.routes.draw do
  
  resources :problems do
    member do 
      post 'upvote'
      post 'downvote'
    end
    resources :comments    
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
end
