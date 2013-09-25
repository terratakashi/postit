class PostsController < ApplicationController
  before_action :get_post, only: [:show, :update, :edit, :vote]
  before_action :require_login, only: [:new, :create, :edit, :update, :vote]

  def index
    @posts = Post.includes(:creator, :votes).all
  end

  def show
    @comments = @post.comments.includes(:creator, :votes)
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

  def vote
    vote = Vote.new(:user => current_user, :votable => @post, :vote => params[:vote])
    respond_to do |format|

      format.html do 
        if vote.save 
          flash[:notice] = "Vote success!"
        else
          flash[:error] = "Vote fail!"
        end
        redirect_to root_path
      end
      # respond to ajax
      format.js {render :js => "alert('Vote fail!')" unless vote.save}
    end
  end

  private

  def secure_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def get_post
    @post = Post.find(params[:id])   
  end



end
