Rails.application.routes.draw do

  post "logout" => "users#logout"
  post "login" => "users#login"
  get "login" => "users#login_form"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "signup" =>"users#new"
  post "users/create" => "users#create"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "/" => "home#top"
  get "about" => "home#about"

  devise_for :users
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create] do
  resources :comments, only: [:create]
  end
end
