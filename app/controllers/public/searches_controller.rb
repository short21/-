class Public::SearchesController < ApplicationController
  before_action :require_access_time
  before_action :authenticate_user!

  def search
    @range = params[:range]

      if @range == "User"
        @users = User.looks(params[:search], params[:word])
      else
        @posts = Post.looks(params[:search], params[:word])
      end
  end

  def require_access_time
    if 23 <= Time.current.hour || Time.current.hour <= 5
      redirect_to times_path
    end
  end

end
