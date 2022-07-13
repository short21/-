class Public::FavoritesController < ApplicationController
  before_action :require_access_time
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    #通知の作成
    post.create_notification_favorite!(current_user)
    respond_to do |format|
        format.html {redirect_to request.referrer}
        format.js
    end

  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to posts_path(post)
  end

  def require_access_time
    if 23 <= Time.current.hour || Time.current.hour <= 5
      redirect_to times_path
    end
  end

end
