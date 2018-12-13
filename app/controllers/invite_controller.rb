require './app/models/poros/invite.rb'

class InviteController < ApplicationController

  def new

  end


  def create
    username = params[:github_username]
    invite   = Invite.new(current_user, username)
    address  = invite.get_github_email

    binding.pry

    # Create a mailer
    flash[:invite] = "Successfully sent invite!"
    flash[:invite] = "The Github user you selected doesn't have an email address associated with their account."
    redirect_to dashboard_path
  end



end
