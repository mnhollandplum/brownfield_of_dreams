
class TutorialsController < ApplicationController

  def show
    four_oh_four unless tutorial = Tutorial.find_by_id( params[:id] )
    (four_oh_four unless current_user) if tutorial.classroom == true
    @facade = TutorialFacade.new(tutorial, params[:video_id])
  end

end
