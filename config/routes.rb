# config/routes.rb

Bloccit::Application.routes.draw do

  resources :posts, only: [:index]

  resources :topics do
    resources :posts do
      resources :comments, only: [:create, :destroy]
    end
  end

  devise_for :users
  resources :users, only: [:show, :index, :update]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end