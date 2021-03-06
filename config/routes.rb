Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  resources :categories do
    resources :tasks
  end
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
