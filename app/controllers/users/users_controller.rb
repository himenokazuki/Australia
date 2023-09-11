class Users::UsersController < ApplicationController
  def show
    # @user = current_user
    @users = User.find(params[:id])
    @posts = @user.posts
    @following_users = @user.following_users
    @follower_users = @user.follower_users

  end
  
  def index
    @users = User.all
    @posts = Post.all
  end

  def edit
  end

  def update
    @user = current_customer
   if  @user.update(customer_params)
        flash[:notice] = "successfully "
        redirect_to new_user_registration_path(@user.id)
   end
  end
  
  def confirm
  end

  def destroy
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_user_registration_path
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  
  end
    # フォロー一覧
  def follows
    user = User.find(params[:id])
    @users = user.following_users
  end

    # フォロワー一覧
  def followers
    user = User.find(params[:id])
    @user = user.follower_users
  end

end
