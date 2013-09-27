class CategoriesController < ApplicationController

  before_action :require_admin, only: [:new, :create]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(secure_param)

    if @category.save
      flash[:notice] = "The category has been created."
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @category = Category.find_by_slug(params[:id])
    @posts = @category.posts.includes(:creator, :votes)
    render "posts/index"
  end

  private

  def secure_param
    params.require(:category).permit(:name)
  end


end