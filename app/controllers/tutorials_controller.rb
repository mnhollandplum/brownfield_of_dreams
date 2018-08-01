class TutorialsController < ApplicationController

  def index
    @tutorials = Tutorial.all
  end

  def show
    tutorial = Tutorial.find(params[:id])
    @presenter = TutorialPresenter.new(tutorial, params[:video_id])
    if @presenter.next_video_position >= @presenter.position_array.length
      flash[:success] == "You did it"
    end
  end
end
