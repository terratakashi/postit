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
    
  end

  def update

  end


  private

  def secure_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end