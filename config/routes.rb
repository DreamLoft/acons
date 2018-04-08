Rails.application.routes.draw do
  resources :payees
  resources :payee_categories
  resources :construction_stock_issues
  resources :construction_stock_fillings
  resources :construction_stocks
  resources :construction_payments
  resources :office_deals do
    resources :apartment_payments
  end

  resources :office_customers
  #resources :apartments
  resources :projects do
    resources :apartments
  end
  devise_for :users
  root 'welcome#index'
#  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
  resources :coupons
#  resources :logs
  resources :bookings do
      resources :room_services
  end
  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user
#  resources :payments
  resources :stocks, except: [:edit , :update]
  resources :stock_items
  resources :guests
end
