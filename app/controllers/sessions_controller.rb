class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.visible && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    elsif !user.visible
      flash[:danger] = "tai khoan da bi khoa"
      render 'new'
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
