class Public::UsersController < ApplicationController
  #時間制限の設定
  before_action :require_access_time

  def show
    @page = Post.all.page(params[:page]).per(10)
    @user =  @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
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

#ゲストユーザー
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

#23から5時まで制限
  def require_access_time
    if 21 <= Time.current.hour || Time.current.hour <= 5
      redirect_to times_path
    end
  end


end
