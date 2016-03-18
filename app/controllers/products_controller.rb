class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    if params[:query]
      @products = Product.where("name LIKE ?", "%#{params[:query]}%").paginate(:page => params[:page], :per_page => 30)
    else
      @products = []
    end
  end

  def show
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
