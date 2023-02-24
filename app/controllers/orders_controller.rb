class OrdersController < ApplicationController
  before_action :set_lead, only: [:new, :create]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(lead: @lead, status: "New")
    @order.save
    redirect_to order_path(@order)
  end

  def show
    @order = Order.find(params[:id])
    @onotes = @order.onotes
    @item = Item.new
    @onote = Onote.new
    @lead = @order.lead
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to order_path
    flash[:notice] = "Status updated succesfully"
  end

  private

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
