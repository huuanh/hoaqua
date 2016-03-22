class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :not_admin

  def index
    if params[:query]
      @products = Product.where("name LIKE ?", "%#{params[:query]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @products = []
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.js
      else
        format.js { render inline: "alert('khong thanh cong');"  }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.js
      else
        format.js { render inline: "alert('khong thanh cong');"  }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:price, :name, :description, :make, :img_link)
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
