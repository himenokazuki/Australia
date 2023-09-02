class Users::UsersController < ApplicationController
  def show
    @user=current_user
    @posts=Post.all
    @post_new=Post.new
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def destroy
  end

end
