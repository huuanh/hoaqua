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

  def creates
    auth_hash = request.env['omniauth.auth']
    # auth_hash['user_info']['email']
    if User.where(username: auth_hash['uid']).empty?
      @user = User.new
      @user.name = auth_hash['info']['name']
      @user.username = auth_hash['uid']
      @user.email = auth_hash['uid'] + '@lifetime.vn'
      @user.password = '123456'
      @user.password_confirmation = '123456'
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:danger] = 'khong thanh cong'
        redirect_to root_path
      end
    else
      session[:user_id] = User.where(username: auth_hash['uid']).first.id
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
