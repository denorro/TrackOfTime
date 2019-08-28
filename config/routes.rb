Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'static/home'
  root 'static#home'
end
