class Admin::BillsController < ApplicationController
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    respond_to do |format|
      format.js
    end
  end

  def checked
    @bill = Bill.find(params[:id])
    if @bill.checked
      @bill.checked = false
    else
      @bill.checked = true
    end
    if @bill.save
      respond_to do |format|
        format.js
      end
    end
  end
end
