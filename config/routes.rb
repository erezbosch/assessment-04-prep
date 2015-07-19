Links::Application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :links, only: [:new, :create, :edit, :update, :index, :show] do
    resources :comments, only: :create
  end
  resources :comments, only: :destroy
end
