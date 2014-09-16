class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def require_signin!
    if cookies[:user_id]
    else
      flash.notice = "Please signup before continuing"
      redirect_to new_session_path
    end
  end

   def authorize_admin!
    require_signin!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end


  def current_user
    if cookies[:user_id]
      @current_user ||= User.find(cookies[:user_id]) 
    else
      nil
    end
  end
  helper_method :current_user
end
