class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find_by(name: name)
  end

  def restrict_access!
    authenticate_or_request_with_http_token do
      current_user.present?
    end
  end

  private

  def name
    ActionController::HttpAuthentication::Token.token_and_options(request)
  end

end
