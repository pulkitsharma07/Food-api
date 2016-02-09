Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      post '/user/new', to: 'users#create'
      get  '/user/see', to: 'users#chk'

    end
  end
end
