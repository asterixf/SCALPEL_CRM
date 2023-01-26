class LnotesController < ApplicationController

  def new
    @lnote = Lnote.new
  end

  def create
    @lnote = Lnote.new(lnote_params)
    @lnote.lead = @lead
    if @lnote.save
      redirect_to leads_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def lnote_params
    params.require(:lnotes).permit(:note)
  end
end
