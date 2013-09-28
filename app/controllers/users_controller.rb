class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)

    if @user.save 
      flash[:notice] = "The acoount of #{@user.username} has been created."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render "new"
    end
    
  end

  def edit
    @user = User.find_by_slug(params[:id])
  end

  def update
    @user = User.find_by_slug(params[:id])
    if @user.update_attributes(secure_params) 
      flash[:notice] = "The acoount of #{@user.username} has been updated."
      redirect_to root_path
    else
      render "edit"
    end
  end


  private

  def secure_params
    params.require(:user).permit(:username, :password, :password_confirmation, :time_zone)
  end

end