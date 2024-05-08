class ForumController < ApplicationController
  def index
    @user = User.find_by(params[:id])
    @snapshot = Snapshot.find_by(params[:id])
    @feed_items = Snapshot.all.order(created_at: :desc).paginate(page: params[:page])
  end
end