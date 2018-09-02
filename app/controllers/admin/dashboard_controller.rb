class Admin::DashboardController < Admin::BaseController
  def show
    @presenter = AdminDashboardPresenter.new
  end
end

