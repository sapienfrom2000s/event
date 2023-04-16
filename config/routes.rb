Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get 'login', to: 'e#index'
  end
  resources :e
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/my_events', to: "e#my_events"
  root "e#index"
  resources :e do
    post 'attendance/create'
  end
end
