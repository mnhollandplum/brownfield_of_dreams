class VideoController < ApplicationController
  def show
    @video_id = params[:video_id]
  end
end
