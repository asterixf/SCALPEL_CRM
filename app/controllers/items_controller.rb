class ItemsController < ApplicationController
  before_action :set_order, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.order = @order
    if @item.save
      flash[:notice] = "Item Added succesfuly"
    else
      flash[:alert] = @item.errors.full_messages.join
    end
    redirect_to order_path(@order)
  end

  private

  def set_order
    @order = Order.find(:order_id)
  end

  def item_params
    params.require(@item).permit(:quantity, :product)
  end
end
