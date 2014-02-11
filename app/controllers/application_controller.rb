class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def current_user
    if session[:auth_token]
      @current_user ||= User.find(session[:auth_token])
    elsif cookies[:auth_token]
      @current_user ||= User.find_by_auth_token!(cookies[:auth_token])
    end
  end
  helper_method :current_user

  def authorize
    redirect_to signin_url, alert: "Not authorized" if current_user.nil?
  end
end
