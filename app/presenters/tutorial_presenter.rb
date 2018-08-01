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

  def next_video_position
    current_video.position + 1
  end

  def next_video
    vid = videos.find_by(position: next_video_position)
    vid.id if vid
  end

  def position_array
    videos.map do |vid|
      vid.position
    end
  end

  def play_video
    position_array.length >= next_video_position
  end

end
