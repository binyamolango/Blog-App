Rails.application.routes.draw do
  devise_for :users, :controllers => { :confirmations => 'devise/confirmations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get 'up' => 'rails/health#show', as: :rails_health_check
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    root to: 'devise/sessions#new'
  end

  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    resources :users, only: [:index] do
      resources :posts, only: [:index] do
        resources :comments, only: %i[index create]
      end
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
