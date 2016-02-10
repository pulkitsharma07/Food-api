Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      post '/user/new', to: 'users#create'
      get  '/user/orders', to: 'users#orders'

      get '/food_items/all', to: 'food_items#index'

      post '/order/create', to: 'orders#create'
      get '/order/view', to: 'orders#show'
      put '/order/delivered', to: 'orders#delivered'


      post '/payment/received', to: 'payments#received'
      post '/payment/refund', to: 'payments#refund'

      put '/order_details/update', to: 'order_details#update'
    end
  end
end
