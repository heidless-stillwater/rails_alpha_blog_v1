class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  helper_method :current_user
  helper_method :logged_in?

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # use 'current_user' as a boolean 
    !!current_user
  end

  def require_user
    if !logged_in? 
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end

end
