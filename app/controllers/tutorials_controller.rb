class TutorialsController < ApplicationController
  def show
    tutorial = Tutorial.find(params[:id])
    @presenter = TutorialPresenter.new(tutorial, params[:video_id])
  end
end
