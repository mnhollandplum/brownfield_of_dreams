class WelcomeController < ApplicationController
  def index
    a_videos = VideoService.new
    @videos = a_videos.playlist
  end
end
