Rails.application.routes.draw do
 
  devise_for :users
  root 'events#index'

  namespace :admin do
    resources :users
    resources :event_submissions, only: [:show, :index, :edit, :update]
    root 'admin#index'
  end

  resources :events
  resources :users, only: [:show]
  



  
 
  
  get 'static_pages/secret'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
