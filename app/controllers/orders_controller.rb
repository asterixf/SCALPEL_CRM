class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @lead = Lead.find(params[:lead_id])
    @order = Order.new
    @order.lead = @lead
  end
end
