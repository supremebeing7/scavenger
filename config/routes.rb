Scavenger::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :pages
  resources :crawls
  resources :places
  resources :reports, only: [:new, :create]
  resources :users, only: :show
  resources :completed_crawls, except: [:show]
  resources :feedbacks, only: [:new, :create]
  root to: "pages#home"
end
