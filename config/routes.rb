Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :tasks, only: [:create, :destroy, :done, :undone]

  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :create, :destroy, :done, :undone] do
        post :complete, to: "tasks#done"
      end
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
    end
  end

  root to: 'landing#index'
  post :done, to: 'tasks#done'
  post :undone, to: 'tasks#undone'
end
