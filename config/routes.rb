Rails.application.routes.draw do
  get '/today' => 'tasks#today'
  get '/profile' => 'profile#index'
  root 'home#index'
  resources :tasks
  devise_for :users
  resources :categories do
    resources :tasks
  end
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
