class WelcomeController < ApplicationController
  def index
    @videos = VideoService.new.playlist
  end
end
