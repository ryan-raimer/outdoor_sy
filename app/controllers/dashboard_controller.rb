class DashboardController < ApplicationController
  def index
    @vehicles = Vehicle.joins(:customer)
  end
end
