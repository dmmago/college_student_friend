class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def index
     @customers = Customer.page(params[:page])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.is_deleted == false
    @customer.update(is_deleted: true)
    @customer.seats.update_all(customer_id: nil)#退会処理とともに座席登録も空にする
    redirect_to admin_customer_path(@customer)
    else
    @customer.update(is_deleted: false)
    redirect_to admin_customer_path(@customer)
    end
  end

end
