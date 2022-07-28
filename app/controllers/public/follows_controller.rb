class Public::FollowsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.follow(params[:user_id])
    user = User.find(params[:user_id])
     #通知の作成
	  user.create_notification_follow!(current_user)
	  redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    @page = Post.all.page(params[:page]).per(10)
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    @page = Post.all.page(params[:page]).per(10)
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
