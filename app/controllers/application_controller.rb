class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      resource = User.find_by(auth_token: token)
      if resource
        sign_in :user, resource
      else
        render :json => { :errors => 'bad request' }, status: 422
      end
    end
  end
end
