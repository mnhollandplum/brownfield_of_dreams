class TutorialsController < ApplicationController

  def index
    @tutorials = Tutorial.all
  end

  def show
    if params[:video_id] == nil
      tutorial = Tutorial.find(params[:id])
      @presenter = TutorialPresenter.new(tutorial)
    else
      tutorial = Tutorial.find(params[:id])
      @presenter = TutorialPresenter.new(tutorial)
      @current_vid = Video.find(params[:video_id])
    end
  end
end
