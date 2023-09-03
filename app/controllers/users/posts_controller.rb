class Users::PostsController < ApplicationController
  def index
   @user=current_user
   @post=Post.new
   @posts=Post.all
  end

  def show
    @post = Post.find(params[:id])
    #@posts = Post.all
    #@post_new = Post.new
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id#アソシエーション１対多の関係
    post.save
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to'/users/users/:id'
  end
  
  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:introduction, :image)
  end
end