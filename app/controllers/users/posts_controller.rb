class Users::PostsController < ApplicationController
  def index
   @user = current_user
   @post = Post.new
   @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    #@posts = Post.all
    #@post_new = Post.new
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id#アソシエーション１対多の関係
    @post.save
    redirect_to users_user_path(current_user)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user.id == current_user.id
      if @post.destroy
        redirect_to users_posts_path(@post.user.id), notice: '投稿が削除されました。' and return
      else
        redirect_to users_posts_path(@post.user.id), alert: '投稿の削除に失敗しました。' and return
      end
    end
    redirect_to users_user_path(current_user)

  end

  def search
    if params[:keyword].present?
      @posts = Post.where('introduction LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @keyword = "投稿が見つかりませんでした。"
      @posts = []
    end
  end

  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:introduction, :image)
  end
end