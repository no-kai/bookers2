Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about'


  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]  do

  end
  resources :users, only: [:index, :show, :edit, :update]
end