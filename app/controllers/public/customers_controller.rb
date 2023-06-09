class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!


  def show
    @customer = Customer.find(params[:id])
    
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path

  end

  def index
    @customers = Customer.page(params[:page])
  end
  
  def destroy
    customer = Customer.find(params[:id])
    customer.destroy 
    flash[:notice] = "退会しました"
    redirect_to root_path 
  end



  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :school_year, :faculty, :introduction, :profile_image)
  end
end