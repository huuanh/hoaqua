class WelcomeController < ApplicationController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 10)
    if params[:value] == 'list'
      @mode = 'list'
      render :list_grid
    elsif params[:value] == 'grid'
      @mode = 'grid'
      render :grid_list
    end
  end
end
