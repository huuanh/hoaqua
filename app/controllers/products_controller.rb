class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :liked]

  def index
    if params[:query]
      @products = Product.where("name LIKE ?", "%#{params[:query]}%").paginate(:page => params[:page], :per_page => 9)
    else
      @products = Product.paginate(:page => params[:page], :per_page => 9)
    end
  end

  def show
  end

  def liked
    if current_user.liked_product(@product).count > 0
      current_user.liked_product(@product).first.destroy
    else
      Liked.create(user:current_user, product: @product)
    end
    respond_to do |format|
      format.js
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
