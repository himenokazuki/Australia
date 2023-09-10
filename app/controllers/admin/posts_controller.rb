class Admin::PostsController < ApplicationController
  def show
    @posts = Post.find(params[:id])
  end

  def index
     @posts = Post.all
  end

  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_homes_top_path
  end
end
