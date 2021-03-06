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
  get "about", to: "products#about"
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  get "orders/new", to: "orders#new", as: "checkout"
  post "orders/update_taxes/:province_id", to: "orders#update_taxes", as: "update_taxes"

  resources :products
  resources :categories
  resources :users
  resources :orders
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
