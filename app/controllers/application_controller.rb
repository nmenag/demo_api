class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  def authenticate
    authenticate_or_request_with_http_basic do |email, password|
      resource = User.find_by_email(email)
      if resource.valid_password?(password)
        sign_in :user, resource
      else
        render :json => { :errors => 'bad request' }, status: 422
      end
    end
  end
end
