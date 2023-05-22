Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get 'login', to: 'e#index'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  resources :e
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/my_events', to: "e#my_events"
  root "e#index"
  resources :e do
    post 'attendance/create'
    post 'attendance/delete'
  end
end
