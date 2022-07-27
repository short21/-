class Public::UsersController < ApplicationController
    before_action :require_access_time

  def show
    @user =  @user = User.find(params[:id])
    @posts = @user.posts
    @post_new = Post.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "You have updated user successfully."
    else
      render "users/edit"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def require_access_time
    if 23 <= Time.current.hour || Time.current.hour <= 5
      redirect_to times_path
    end
  end


end
