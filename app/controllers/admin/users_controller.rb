class Admin::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post_new = Post.new
  end

  def edit
    @user = User.find(params[:id])
      render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(user.id), notice: "You have updated user successfully."
    else
      render "users/edit"
    end
  end



  private

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

end
