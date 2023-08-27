Rails.application.routes.draw do

  resources :post_images, only: [:new, :index, :show, :edit]
  devise_for :users
  #devise_for :books

  root to: "home#top"
  get "home/about" => "home#about", as: "about"

  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:new, :show, :index, :create, :edit,:update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
