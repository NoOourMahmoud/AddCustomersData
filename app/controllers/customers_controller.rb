class CustomersController < ApplicationController
  before_action :setCustomer, only: [:destroy, :edit]

  def index
    @pagy, @customers = pagy(Customer.order(name: :ASC), items: 7)
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  def edit
    $prevId = @customer[:id]
  end

  def update
    @customer = Customer.find($prevId)
    if @customer.update(params_customer)
      redirect_to customers_path, notice: "customer updated"
    else
      render :edit
    end
  end
  

  private
  #there isn't ID in params
  def setCustomer
    @customer = Customer.find(params[:format])
  end

  def params_customer
    params.require(:customer).permit(:mobile, :name, :address)
  end
end