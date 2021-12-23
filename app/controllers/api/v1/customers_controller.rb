class Api::V1::CustomersController < ApplicationController

  def index
    @customers = Customer.order(name: :DESC)
    render json: @customers
  end

  def show
    lastId = Customer.last.id.to_s
    if lastId >= params[:id] && params[:id] > "0"
      @customer = Customer.find(params[:id])
    else
      @customer = Customer.last
    end
    render json: @customer
  end
end
