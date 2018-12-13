
class TutorialsController < ApplicationController

  def show
    four_oh_four unless tutorial = Tutorial.find_by_id(params[:id])
    @facade = TutorialFacade.new(tutorial, params[:video_id])
  end

end
