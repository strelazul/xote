Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               registrations: "users/registrations",
               sessions:      "users/sessions",
               passwords:     "users/passwords",
               confirmations: "users/confirmations"
             }
  devise_scope :user do
    get "signup",  to: "users/registrations#new"
    get "signin",  to: "users/sessions#new"
    delete "signout", to: "users/sessions#destroy"
  end
  root "products#index"

  resources :products
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
