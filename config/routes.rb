Rails.application.routes.draw do

  post "customers/:id/orders" => "api#create_order"
  post "customers" => "api#create_customer"
  get "products" => "api#get_products"
  get "customers/:id/orders" => "api#get_customer_orders"
  post "customers/:id/notifications" => "api#check_stock"
  resources :orders
  resources :products
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
