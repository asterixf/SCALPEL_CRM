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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    order = @item.order
    @item.update(item_params)
    redirect_to edit_order_path(order)
    flash[:notice] = "#{@item.product.name} updated"
  end

  def destroy
    @item = Item.find(params[:id])
    order = @item.order
    @item.destroy
    redirect_to edit_order_path(order)
    flash[:notice] = "Item deleted"
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def item_params
    params.require(:item).permit(:quantity, :product_id)
  end
end
