Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :spots, only: [:new, :create, :show, :edit, :update]
  resources :tags, only: [:index, :new, :create, :edit, :update]
end
