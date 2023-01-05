class LeadsController < ApplicationController

  def index
    @leads= current_user.leads
  end

  def new
    @lead= Lead.new
  end
end
