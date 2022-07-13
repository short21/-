class Public::FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_access_time
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
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def require_access_time
    if 23 <= Time.current.hour || Time.current.hour <= 5
      redirect_to times_path
    end
  end

end
