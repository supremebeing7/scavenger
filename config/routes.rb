Scavenger::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :pages
  resources :crawls
  resources :places
  root to: "pages#home"
end
