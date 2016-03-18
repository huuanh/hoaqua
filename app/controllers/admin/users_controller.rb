class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :not_admin

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.js
      else
        format.js { render inline: "alert('khong thanh cong');"}
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.js
      else
        format.js { render inline: "alert('khong thanh cong');"}      end
    end
  end

  def destroy
    if @user.visible
      @user.visible = false
    else
      @user.visible = true
    end
    @user.save
    respond_to do |format|
      format.js
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end

  def not_admin
    unless admin?
      flash[:danger] = 'nguy hiem!!!'
      redirect_to root_path
    end
  end

  def admin?
    current_user && (current_user.id == 1)
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
end
