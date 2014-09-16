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

  def current_user
    User.find(cookies[:user_id])
  end
end
