class Users::UsersController < ApplicationController
  def show
    # @user = current_user
    @user = User.find(params[:id])
    @posts = @user.posts

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

end
