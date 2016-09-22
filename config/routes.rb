Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :tasks, only: [:create, :destroy, :done, :undone]
  
  root to: 'landing#index'
  post :done, to: 'tasks#done'
  post :undone, to: 'tasks#undone'
end
