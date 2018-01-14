Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
#  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
  resources :coupons

  resources :logs
  resources :bookings do
      resources :room_services
  end
  resources :payments
  resources :stocks, except: [:edit , :update]
  resources :stock_items
  resources :guests
end
