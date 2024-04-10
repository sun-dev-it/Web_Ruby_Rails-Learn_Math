class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:index, :edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: :destroy
  def index
    @users = User.paginate(page: params[:page])
  end  

  def show
    @user = User.find(params[:id])
    @snapshots = @user.snapshots.paginate(page: params[:page])
  end

  def signup
    @user = User.new
  end

  def new
    @user = User.new
  end


  def edit
    @user = User.find_by(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "welcome to AI"
      redirect_to @user
    else
      flash[:danger] = "Nhap sai"
      redirect_to signup_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Cap nhat thong tin"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:success] = "Người dùng đã được xóa thành công."
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find_by(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
