class LnotesController < ApplicationController
  before_action :set_lead, only: [:new, :create]

  def new
    @lnote = Lnote.new
  end

  def create
    @lnote = Lnote.new(lnote_params)
    @lnote.lead = @lead
    @lnote.user = current_user
    if @lnote.save
      flash[:notice] = "Note was saved succesfuly"
    else
      flash[:alert] = @lnote.errors.full_messages.join
    end
    redirect_to lead_path(@lead)
  end

  private

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end

  def lnote_params
    params.require(:lnote).permit(:note, :lead_id, :user_id)
  end

end
