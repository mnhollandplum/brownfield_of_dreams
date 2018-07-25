class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :find_bookmark

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_bookmark(id)
    current_user.user_videos.find_by(video_id: id)
  end
end
