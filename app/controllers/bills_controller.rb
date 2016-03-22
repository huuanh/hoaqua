class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    @bills = current_user.my_cart
  end

  def edit
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.user = User.find(params[:user_id])
    @bill.product = Product.find(params[:product_id])

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
    end
  end

  private
  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:user_id, :product_id, :number)
  end
end
