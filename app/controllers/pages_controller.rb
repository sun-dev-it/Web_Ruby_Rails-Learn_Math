class PagesController < ApplicationController
  def home
    @user = User.find_by(params[:id])
  end
  def help
    @user = User.find_by(params[:id])
  end
  def CongThuc
    @user = User.find_by(params[:id])
  end
end
