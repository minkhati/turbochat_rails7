Rails.application.routes.draw do
  get 'users/show'
  
  root 'pages#home'
  resources :rooms do
    resources :messages
  end
  
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end
  
  get "user/:id", to: "users#show", as: 'user'  
  # Defines the root path route ("/")
  # root "articles#index"
end
