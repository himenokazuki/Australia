# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]
   protect_from_forgery

  # GET /resource/sign_in
  # def new
  #   super
  # end

#POST /resource/ sign_in
  # def create
  #   @user=User.new(user_params)
  #   @user.save
  #   redirect_to '/users/user/show'
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   end

  private

  def after_sign_in_path_for(resource)
    users_user_path(resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
  unless user.id == current_user.id
      redirect_to users_user_show_path(current_user)
  end
  end
end