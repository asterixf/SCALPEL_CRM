Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"
  get 'dashboard', to: 'leads#dashboard'
  resources :leads, only: [:index, :show, :edit, :update] do
    resources :orders, only: [:new, :create]
  end
  resources :lnotes, only: [:new, :create]
  resources :customers, only: [:index, :new, :create, :edit, :update] do
    resources :leads, only: [:new, :create]
  end
  resources :customers, only: [:edit, :update]
end
