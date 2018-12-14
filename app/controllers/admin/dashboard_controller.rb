class Admin::DashboardController < ApplicationController #Admin::BaseController
  before_action :require_admin!

  def show
    @facade = AdminDashboardFacade.new
  end
end
