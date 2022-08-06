class Public::PostsController < ApplicationController
  before_action :require_access_time
  def new
    @post_new = Post.new
  end

  def index
    @page = Post.all.page(params[:page]).per(10)
    @post_new = Post.new
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
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
      render 'new'
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

  def require_access_time
    if 21 <= Time.current.hour || Time.current.hour <= 5
      redirect_to times_path
    end
  end
end
