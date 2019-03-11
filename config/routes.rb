Rails.application.routes.draw do

  root 'books#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]
  get 'about' => 'books#about'
#doでendは結びつくので、endは一つでおk
end