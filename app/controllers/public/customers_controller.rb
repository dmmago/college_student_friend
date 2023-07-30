class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!


  def show
    @customer = Customer.find(params[:id])
    if @customer.anonymity == false && @customer.is_deleted == false
      render "show"
    elsif @customer == current_customer
      render "show"
    else
      redirect_to root_path
    end
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
    @customers = Customer.where(is_deleted: 'false', anonymity: 'false').page(params[:page])
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(params[:id])
    if @customer == current_customer
      @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
    else
      redirect_to root_path
    end
  end



  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :school_year, :faculty, :introduction, :anonymity, :profile_image)
  end
end