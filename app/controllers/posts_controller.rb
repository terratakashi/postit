class PostsController < ApplicationController
  before_action :get_post, only: [:show, :update, :edit]
  before_action :require_login, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.includes(:creator).all
  end

  def show
    @comments = @post.comments.includes(:creator)
    @comment = Comment.new if @comment.nil?
  end

  def create
    @user = current_user
    @post = @user.posts.new(secure_params)
    if @post.save
      flash[:notice] = "A Post has been created."
      redirect_to @post
    else
      render "new"
    end
  end

  def new
    @post = Post.new
  end

  def update
    if @post.update(secure_params)
      flash[:notice] = "The Post has been updated."
      redirect_to @post
    else
      render "edit"
    end
  end

  def edit
  end

  private

  def secure_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def get_post
    @post = Post.find(params[:id])   
  end



end
