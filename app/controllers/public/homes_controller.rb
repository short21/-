class Public::HomesController < ApplicationController
  before_action :require_access_time
  def top
  end

  def about
  end

  def require_access_time
    if 21 <= Time.current.hour || Time.current.hour <= 5
      redirect_to times_path
    end
  end
end
