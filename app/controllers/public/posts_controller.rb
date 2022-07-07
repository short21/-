class Public::PostsController < ApplicationController
  def new
    @post_new = Post.new
  end

  def index
    @post_new = Post.new
    @posts = Post.all
  end

  def show
    @post_new = Post.new
    @post = Post.find(params[:id])
  end

  def create
    @post_new = Post.new(post_params)
    @post_new.user_id = current_user.id
    if @post_new.save
      redirect_to post_path(@post_new), notice: "You have created book successfully."
    else
      @books = Post.all
      render 'index'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body,:image)
  end
end
