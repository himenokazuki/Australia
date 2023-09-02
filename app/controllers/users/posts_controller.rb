class Users::PostsController < ApplicationController
  def index
   @user=current_user
   @post=Post.new
   @posts=Post.all
  end

  def show
  end
  
  def new
  end
  
  def create
  end
end
