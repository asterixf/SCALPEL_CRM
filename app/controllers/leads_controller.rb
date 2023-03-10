class LeadsController < ApplicationController
  before_action :set_customer, only: [:new, :create]

  def index
    if params[:query].present?
      @leads = Lead.global_search(params[:query])
    else
      @leads = Lead.all
    end
  end

  def show
    @lead = Lead.find(params[:id])
    @lnotes = @lead.lnotes
    @lead_orders = @lead.orders
    @lnote = Lnote.new
    @order = Order.new
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.user = current_user
    @lead.customer = @customer
    @lead.status = "New"
    if @lead.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lead = Lead.find(params[:id])
  end

  def update
    @lead = Lead.find(params[:id])
    if @lead.update(lead_params)
      redirect_to lead_path(@lead)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def lead_params
    params.require(:lead).permit(:status, :comments, :follow_up_date, :follow_up_time)
  end
end
