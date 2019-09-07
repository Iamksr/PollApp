Rails.application.routes.draw do
  get 'welcome/index'

  resources :categories
  resources :myoptions
  resources :answers
  devise_for :users
  resources :polls


  # post '/myoptions/:id' => 'myoptions#show', :as => 'myoptions'
  root 'polls#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
