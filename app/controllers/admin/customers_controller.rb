class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @books = Book.where(read_st: true,)
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path
  end

  # 退会させるボタンを押したら動く
  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to admin_customers_path
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :email, :is_deleted)
  end

end
