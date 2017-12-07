class PostsController < ApplicationController
  def index

    @group = Group.find(params[:group_id])
    @posts = @group.posts
  end

  def new
    @group = Group.find(params[:group_id])
    @post = @group.posts.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.new(post_params)
    if @post.save
      redirect_to posts_path(group_id: params[:group_id])
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title)
  end
end
