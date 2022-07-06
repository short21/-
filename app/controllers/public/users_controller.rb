class Public::UsersController < ApplicationController

  def show
    @user =  @user = User.find(params[:id])
    @posts = @user.posts
    @post_new = Post.new
  end

  def edit
    @user =  @user = User.find(params[:id])
  end

  def update
    @user =  @user = User.find(params[:id])
  end

  def destroy
    @user =  @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
