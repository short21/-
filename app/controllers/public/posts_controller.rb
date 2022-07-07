class Public::PostsController < ApplicationController
  def new
    @post_new = Post.new
  end

  def index
    @post_new = Post.new
    @posts = Post.all
    @post_comment = PostComment.new
  end

  def show
    @post_new = Post.new
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def create
    @post_new = Post.new(post_params)
    @post_new.user_id = current_user.id
    if @post_new.save
      redirect_to post_path(@post_new), notice: "You have created book successfully."
    else
      @posts = Post.all
      render 'index'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:body,:image)
  end
end
