class LeadsController < ApplicationController
  before_action :set_customer, only:[:new, :create]

  def index
    @leads = current_user.leads
  end

  def show
    @lead = Lead.find(params[:id])
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

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def lead_params
    params.require(:lead).permit(:status, :comments, :follow_up_date, :follow_up_time)
  end
end
