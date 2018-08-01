class TutorialPresenter < SimpleDelegator

  def initialize(tutorial, video_id = nil)
    super(tutorial)
    @video_id = video_id
  end

  def current_video
    if @video_id
      videos.find(@video_id)
    else
      videos.first
    end
  end

end
