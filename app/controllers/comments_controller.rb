class CommentsController < ApplicationController

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

  def secure_comment
    params.require(:comment).permit(:body)
  end

end