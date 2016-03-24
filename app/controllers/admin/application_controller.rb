class Admin::ApplicationController < ApplicationController
  layout 'admin_application'

  def index
    unless admin?
      flash[:danger] = 'ban khong co quyen'
      redirect_to root_path
    end
    @users = User.all
    @products = Product.all
  end
  def admin?
    current_user && current_user.admin
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
