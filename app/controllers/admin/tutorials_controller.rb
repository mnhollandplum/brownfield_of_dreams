class Admin::TutorialsController < ApplicationController #Admin::BaseController
  before_action :require_admin!

  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def create
  end

  def new
    @tutorial = Tutorial.new
  end

  def update
    tutorial = Tutorial.find(params[:id])
    if tutorial.update(tutorial_params)
      flash[:success] = "#{tutorial.title} tagged!"
    end
    redirect_to edit_admin_tutorial_path(tutorial)
  end

  private
  def tutorial_params
    params.require(:tutorial).permit(:tag_list)
  end
end
