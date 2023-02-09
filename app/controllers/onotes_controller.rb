class OnotesController < ApplicationController
  before_action :set_order, only: [:new, :create]

  def new
    @onote = Onote.new
  end

  def create
    @onote = Onote.new(onote_params)
    @onote.order = @order
    @onote.user = current_user
    if @onote.save
      flash[:notice] = "Note was saved succesfuly"
    else
      flash[:alert] = @onote.errors.full_messages.join
    end
    redirect_to order_path(@order)
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def onote_params
    params.require(:onote).permit(:note)
  end
end
