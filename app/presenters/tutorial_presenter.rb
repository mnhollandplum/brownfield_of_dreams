class TutorialPresenter < SimpleDelegator
  def current_video
    videos.first
  end
end
