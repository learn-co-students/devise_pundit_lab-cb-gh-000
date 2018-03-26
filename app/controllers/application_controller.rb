class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit
  helper_method :current_user
  rescue_from Pundit::NotAuthorizedError do
    flash[:error] = "Access denied."
    redirect_to(request.referrer || root_path)
  end
end
