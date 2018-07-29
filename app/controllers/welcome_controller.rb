class WelcomeController < ApplicationController
  def index

    if params[:tag]
      @tutorials = Tutorial.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 5)
      @list = list_tags(@tutorials).uniq
    else
      @tutorials = Tutorial.all.paginate(:page => params[:page], :per_page => 5)
      @list = list_tags(@tutorials).uniq
    end
  end
end
