class Users::UsersController < ApplicationController
  def show
    @user = current_user
    @user = User.find(params[:id])
    @comment = Comment.new
    @posts = @user.posts
    @following_users = @user.following_users
    @follower_users = @user.follower_users

  end

  def index
    @users = User.all
    @posts = Post.all
  end

  def edit
    #is_matching_login_user
    @user = current_user
    @users= User.find(params[:id])
  end

  def update
    @user = current_user
   if  @user.update(user_params)
        flash[:notice] = "successfully "
        redirect_to users_user_path(@user.id)
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

  #def search
  
  #end


  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

    # フォロー一覧
  def follows
    user = User.find(params[:id])
    @users = user.following_users
    #byebug
  end

    # フォロワー一覧
  def followers
    user = User.find(params[:id])
    @user = user.follower_users
  end
end
