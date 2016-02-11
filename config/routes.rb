Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      post '/user/create', to: 'users#create'
      get  '/user/orders', to: 'users#orders'

      get '/food_items/view', to: 'food_items#index'
      post '/food_items/create', to: 'food_items#create'

      post '/order/create', to: 'orders#create'
      get '/order/view', to: 'orders#show'
      put '/order/delivered', to: 'orders#delivered'
      put '/order/update', to: 'orders#update'

      post '/payment/received', to: 'payments#received'
      post '/payment/refund', to: 'payments#refund'

    end
  end
end
