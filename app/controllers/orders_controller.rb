class OrdersController < ApplicationController
  before_action :set_lead, only: [:new, :create]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.lead = @lead
    @order.status = "New"

  end

  private

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end

end
