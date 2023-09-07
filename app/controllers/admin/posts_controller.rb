class Admin::PostsController < ApplicationController
  def show
    @posts = Post.find(params[:id])
  end

  def index
  end
  
  def edit
  end
  
  def destroy
    @posts = Post.all
    posts.destroy
    redirect_to homes_top_path
  end
end
