Rails.application.routes.draw do
  resources :questions do
    resources :answers
    resources :comments
  end
  
  resources :answers do
    resources :comments
  end

  devise_for :users
  
  root 'questions#index'
end
