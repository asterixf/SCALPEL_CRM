class LeadNotesController < ApplicationController
  before_action :set_lead, only: [:new, :create]

  def new
    @leadnote = LeadNote.new
  end

  private

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end
end
