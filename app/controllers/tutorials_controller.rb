class TutorialsController < ApplicationController

  def index
    @tutorials = Tutorial.all
  end

  def show
    @videos = Tutorial.find(params[:id]).videos
  end
end
