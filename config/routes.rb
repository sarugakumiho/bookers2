Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
  get 'users/about', to: 'users#about', as: 'users_about'
  get 'books/about', to: 'books#about', as: 'books_about'
  # get 'users/path', to: 'users#about', as: 'users-about'
  # get 'books/about', to: 'books#about', as: 'books-about'

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
