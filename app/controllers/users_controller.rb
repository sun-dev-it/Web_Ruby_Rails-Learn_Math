class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
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
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Vui long dang nhap"
        redirect_to login_url
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find_by(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
