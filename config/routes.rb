Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      post '/user/new', to: 'users#create'
      get  '/user/see', to: 'users#chk'

      get '/food_items/all', to: 'food_items#index'

      post '/order/create', to: 'orders#create'
      get '/order/show', to: 'orders#show'
      put '/order/delivered', to: 'orders#delivered'

      put '/order_details/update', to: 'order_details#update'
    end
  end
end
