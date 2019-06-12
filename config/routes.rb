Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  
  devise_for :users
  
  root 'questions#index'
end
