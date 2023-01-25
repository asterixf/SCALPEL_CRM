Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"
  resources :leads, only: [:index, :show] do
    resources :notes, only: [:index, :new, :create]
  end
  resources :customers, only: [:index, :new, :create] do
    resources :leads, only: [:new, :create]
  end
end
