class WelcomeController < ApplicationController
  def index
    @videos = Video.all.paginate(:page => params[:page], :per_page => 5)
  end
end
