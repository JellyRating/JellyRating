class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :set_current_user
  protected
    def set_current_user
      if (current_user.nil?)
        session[:return_to] = request.fullpath
      else
        session.delete(:return_to)
      end
    	redirect_to login_path and return unless current_user
    end
end
