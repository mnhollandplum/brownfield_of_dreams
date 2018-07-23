class WelcomeController < ApplicationController
  def index
    @videos = Video.all
  end
end
