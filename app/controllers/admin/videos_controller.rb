class Admin::VideosController < Admin::BaseController
  def edit
    @video = Video.find(params[:video_id])
  end

  def update
    video = Video.find(params[:id])
      if video.update(video_params)
        flash[:success] = "Position Changed"
      end
    redirect_back(fallback_location: root_path)
  end

  private
    def video_params
      params.permit(:position)
    end
end
