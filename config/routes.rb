Rails.application.routes.draw do
  resources :questions do
    resources :answers
    resources :comments
    resources :votes, only: [:create, :destroy]
  end
  
  resources :answers do
    resources :comments
    resources :votes, only: [:create, :destroy]
  end

  devise_for :users
  
  root 'questions#index'
end
