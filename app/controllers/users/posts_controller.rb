class Users::PostsController < ApplicationController
  def index
   @user = current_user
   @post = Post.new
   @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments

    # @user = User.find(params[:user_id])
    # @user = current_user
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
    #@user = User.find(params[:id])
   # @posts = @user.posts
    
    # viewのform_tagにて
    # 選択したmodelの値を@modelに代入。
    @model = params["model"]
    # 選択した検索方法の値を@methodに代入。
    @method = params["method"]
    # 検索ワードを@contentに代入。
    @content = params[:keyword]
    # @model, @content, @methodを代入した、
    # search_forを@recordsに代入。
    @records = search_for(@model, @content, @method)

  end

  private
  def search_for(model, content, method)
    # 選択したモデルがuserだったら
    if model == 'user'
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
      @users = User.where(name: content)
      # 選択した検索方法がが部分一致だったら
      else
      @users = User.where('name LIKE ?', '%'+content+'%')
      end
    # 選択したモデルがpostだったら
    elsif model == 'post'
      if method == 'perfect'
      @posts = Post.where(introduction: content)
      else
      @posts = Post.where('introduction LIKE ?', '%'+content+'%')
      end
    end
  end
  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:introduction, :image, :created_at, :updated_at)
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end