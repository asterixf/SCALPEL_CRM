class LnotesController < ApplicationController

  def new
    @lnote = Lnote.new
  end

  def create
    @lnote = Lnote.new(lnote_params)
    if @lnote.save
      flash[:notice] = "Note was saved succesfuly"
    else
      flash[:alert] = @lnote.errors.full_messages.join
    end
    redirect_to @lnote.lead
  end

  private

  def lnote_params
    params.require(:lnote).permit(:note, :lead_id, :user_id)
  end
end
