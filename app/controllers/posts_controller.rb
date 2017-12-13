class PostsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @posts = @group.posts
  end

  def new
    @group = Group.find(params[:group_id])
    @post = @group.posts.new
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path(group_id: params[:group_id])
    else
      render :edit
    end
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
