class WelcomeController < ApplicationController

  def index
    tutorials = ( current_user ? Tutorial : Tutorial.where(classroom: false) )
    if params[:tag]
      @tutorials = tutorials.tagged_with(params[:tag]).paginate(page_size)
    else
      @tutorials = tutorials.all.paginate(page_size)
    end
  end


  private

  def page_size
    {
      :page => params[:page],
      :per_page => 5
     }
  end


end
