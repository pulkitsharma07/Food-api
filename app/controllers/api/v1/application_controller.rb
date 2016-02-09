include ActionController::HttpAuthentication::Token::ControllerMethods
include ActionController::MimeResponds

class Api::V1::ApplicationController < ActionController::API

   def restrict_access

    p "Here ......."
    p params
     unless restrict_access_by_params || restrict_access_by_header
       render json: {status: 'failed',message: 'Invalid API Token'}, status: 401
       return
     end
   end

   def restrict_access_by_header
     return true if @current_user

     authenticate_with_http_token do |api_key|
       @current_user = User.find_by_api_key(api_key)
     end
   end

   def restrict_access_by_params
     return true if @current_user

     if params[:api_key]
      @current_user = User.find_by_api_key(params[:api_key])
    else
      nil
    end
  end

end
