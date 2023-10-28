Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :spots do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :tags, only: [:index, :new, :create, :edit, :update]
end
