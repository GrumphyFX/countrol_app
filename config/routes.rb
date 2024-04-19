Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root 'devise/sessions#new'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # resources :transactions, only: [:index, :show, :edit, :new, :create, :update, :destroy]
  resources :wallets, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :goals, only: [:show, :index, :new, :create]
    resources :transactions
    resources :categories
  end
  resources :goals, only: [:new, :create, :edit, :update, :destroy] do
    resources :transactions, only: [:new, :create]
  end
  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
