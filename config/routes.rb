Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :leads, only: [:index]
  resources :customers, only: [:index, :new, :create] do
    resources :leads, only: [:new, :create]
  end
end
