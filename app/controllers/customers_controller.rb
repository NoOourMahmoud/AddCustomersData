require 'pagy/extras/bootstrap'

class CustomersController < ApplicationController
  before_action :setCustomer, only: [:destroy, :edit, :show]

  def index
    @page_size = params[:page_size] || 5
    @pagy, @customers = pagy(Customer.order(name: :ASC), items: params[:page_size] || 5)
  end

  def show
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  def edit
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(params_customer)
      redirect_to customers_path, notice: "customer updated"
    else
      render :edit
    end
  end
  

  private
  def setCustomer
    @customer = Customer.find(params[:id])
  end

  def params_customer
    params.require(:customer).permit(:mobile, :name, :address)
  end
end