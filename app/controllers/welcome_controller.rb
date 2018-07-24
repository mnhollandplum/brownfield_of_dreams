class WelcomeController < ApplicationController
  def index
    @tutorials = Tutorial.all.paginate(:page => params[:page], :per_page => 5)
  end
end
