Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :spots, only: [:new, :create, :show]
  resources :tags, only: [:index, :new, :create, :edit, :update]
end
