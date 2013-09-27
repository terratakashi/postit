class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :get_categories
  helper_method :current_user, :logged_in?
  protect_from_forgery with: :exception


  def get_categories
    @categories ||= Category.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      flash[:error] = "You need to login first!"
      redirect_to root_path
    end
  end

  def require_admin
    # Prevent user is nil, add user check
    if !logged_in? || !current_user.admin?
      flash[:warning] = "Please contact Admin!"
      redirect_to root_path
    end
  end

end
