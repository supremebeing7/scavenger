Scavenger::Application.routes.draw do
  devise_for :users
  root to: "places#index"
end
