class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @user = User.all
    @posts = Post.all
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
       flash[:notice] = "successfully "
      redirect_to admin_homes_top_path(@user.id)
   end
  end

  def destroy
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to admin_homes_top_path
  end

   def reactivate
    @user = User.find(params[:id])
    @user.update(is_deleted: false)
    reset_session
    flash[:notice] = "退会処理を取り消しました。"
    redirect_to admin_homes_top_path
   end
end
