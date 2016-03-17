class WelcomeController < ApplicationController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 30)
  end
end
