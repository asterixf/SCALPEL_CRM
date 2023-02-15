class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @newleads = current_user.leads.where(status: "New")
    @goingleads = current_user.leads.where(status: "Going")
    @wonleads = current_user.leads.where(status: "Won")
  end
end
