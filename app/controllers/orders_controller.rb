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
    @onote = Onote.new
  end

  private

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end

end
