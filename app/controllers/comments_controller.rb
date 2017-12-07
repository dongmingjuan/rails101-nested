class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to comments_path(post_id: params[:post_id])
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title)
  end
end
