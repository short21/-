class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post_comment = PostComment.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_user_path(user.id)
  end

  private

  def post_params
    params.require(:post).permit(:body,:image)
  end

end
