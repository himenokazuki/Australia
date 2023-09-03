class Users::UsersController < ApplicationController
  def show
   # @user=current_user
    @users=User.find(params[:id])
    #@posts=@user.posts
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
