Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonarails.org/routing.html
  # heroku
  root :to => 'cocktails#index'

  resources :cocktails, only: [ :index, :new, :create, :show ] do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [ :destroy ]
end
