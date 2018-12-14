class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :tutorial_name
  helper_method :require_admin!

  add_flash_types :success

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    else (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
    end
  end

  def four_oh_four
    raise ActionController::RoutingError.new('Not Found')
  end

  def require_admin!
    current_user.admin?
  end

end
