Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  resources :users, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :tasks
      resources :users, only: [:index, :show] do
        resources :tasks, only: [:index]
      end
    end
  end
end
