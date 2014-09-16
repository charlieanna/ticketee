class SessionsController < ApplicationController
  def new

  end
  
  def create
    user = User.where(email: params[:session][:email]).first 
    if user && user.authenticate(params[:session][:password])
      cookies[:user_id] = user.id
      flash.notice = "Signed in successfully."
      redirect_to projects_path
    else
      flash.alert = "Sorry."
      render :new
    end
  end
end
