class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def create
      favorite = current_user.favorites.new(post_id: @post.id)
      favorite.save
      @post = Post.find(params[:post_id])
      #通知の作成
      @post.create_notification_by(current_user)
      respond_to do |format|
        format.html {redirect_to request.referrer}
        format.js
      end
  end
end
