Rails.application.routes.draw do
  resources :answers
  devise_for :users
  resources :polls
  root 'polls#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
