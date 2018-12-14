class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :find_bookmark
  helper_method :list_tags
  helper_method :tutorial_name

  add_flash_types :success

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
     @current_user = user
    end
  end

  def four_oh_four
    raise ActionController::RoutingError.new('Not Found')
    # render status: 404
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end
