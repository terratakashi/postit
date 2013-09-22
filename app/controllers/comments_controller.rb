class CommentsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(secure_comment)
    @comment.creator = current_user
    if @comment.save
      flash[:notice] = "A Comment created."
      redirect_to post_path(@post)
    else
      render "posts/show" 
    end
  end

  def vote
    comment = Comment.find(params[:id])
    vote = Vote.new(:user => current_user, :votable => comment, :vote => params[:vote])
    if vote.save 
      flash[:notice] = "Vote success!"
    else
      flash[:error] = "Vote fail!"
    end
    binding.pry
    redirect_to post_path(params[:post_id])
  end


  private

  def secure_comment
    params.require(:comment).permit(:body)
  end

end