class LeadsController < ApplicationController
  before_action :set_customer, only: [:new, :create]

  def dashboard
    @newleads = current_user.leads.where(status: "New")
    @goingleads = current_user.leads.where(status: "Going")
  end

  def show
    @lead = Lead.find(params[:id])
    @lnotes = @lead.lnotes
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
    if @lead.save
      redirect_to leads_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lead = Lead.find(params[:id])
  end

  def update
    @lead = Lead.find(params[:id])
    @lead.update(lead_params)
    redirect_to lead_path(@lead)
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def lead_params
    params.require(:lead).permit(:status, :comments, :follow_up_date, :follow_up_time)
  end
end
