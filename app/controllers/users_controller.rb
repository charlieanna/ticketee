class UsersController < ApplicationController

  def show
    @user = User.find(params[:id]) 
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    User.find(params[:id]).update_attributes(user_params)
    flash.notice = "Profile has been updated."
    redirect_to projects_path
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "You have signed up successfully."
      redirect_to projects_path
    else
      render :new
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
