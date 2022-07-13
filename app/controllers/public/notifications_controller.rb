class Public::NotificationsController < ApplicationController
  before_action :require_access_time
  def index
      #current_userの投稿に紐づいた通知一覧
    	@notifications = current_user.passive_notifications
      #@notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ
    	@notifications.where(checked: false).each do |notification|
      	notification.update(checked: true)
      end
  end

  def destroy_all
    #通知を全削除
  	@notifications = current_user.passive_notifications.destroy_all
  	redirect_to notifications_path
  end

  def require_access_time
    if 23 <= Time.current.hour || Time.current.hour <= 5
      redirect_to times_path
    end
  end

end
