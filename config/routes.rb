Rails.application.routes.draw do
  get 'welcome/index'
 get '/polls/welcome', to: 'polls#welcome'
  resources :categories
  resources :myoptions
  resources :answers
  devise_for :users
  resources :polls
  # get 'polls/welcome' , :as => 'welcome'

  # post '/myoptions/:id' => 'myoptions#show', :as => 'myoptions'
  root 'polls#welcome'

    # post '/polls/welcome' => 'polls#welcome', :as => 'welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
