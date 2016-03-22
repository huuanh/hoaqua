class Admin::BillsController < ApplicationController
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    respond_to do |format|
      format.js
    end
  end
end
