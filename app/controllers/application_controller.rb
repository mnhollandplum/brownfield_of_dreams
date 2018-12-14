class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :find_bookmark
  helper_method :list_tags
  helper_method :tutorial_name
  helper_method :require_admin!

  add_flash_types :success

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    # elsif (user_id = cookies.signed[:user_id])
    else (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
    # if user && user.authenticated?(:remember, cookies[:remember_token])
    #  # log_in user
    #  @current_user = user
    # end
    end
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def find_bookmark(id)
  #   current_user.user_videos.find_by(video_id: id)
  # end

  # def tutorial_name(id)
  #   Tutorial.find(id).title
  # end

  def four_oh_four
    raise ActionController::RoutingError.new('Not Found')
    # render status: 404
  end

  # def log_in(user)
  #   session[:user_id] = user.id
  # end

  def require_admin!
    current_user.admin?
  end

end
