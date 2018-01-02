Rails.application.routes.draw do
  resources :logs
  resources :bookings
  resources :payments
  resources :stocks
  resources :stock_items
  resources :guests
  devise_for :users
  root 'welcome#index'
#  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
  resources :coupons
end
