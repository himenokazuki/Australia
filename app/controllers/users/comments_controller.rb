class Users::CommentsController < ApplicationController
  
   def create
    @posts = Post.find(params[:post_id])
    comment.user_id = current_user.id
    comment.post_id = posts.id
    comment.save
    redirect_to users_user_path(posts)
   end
   
   private

  def comment_params
    params.require(:post).permit(:comment)
  end
end