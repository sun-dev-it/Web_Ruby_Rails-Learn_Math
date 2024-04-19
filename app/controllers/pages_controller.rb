class PagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find_by(params[:id])
      @snapshot = current_user.snapshots.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
  def help
    @user = User.find_by(params[:id])
  end
  def CongThuc
    @user = User.find_by(params[:id])
  end
end
