require './app/models/poros/invite.rb'

class InviteController < ApplicationController

  def new

  end


  def create
    username = params[:github_username]
    invite = Invite.new(current_user, username)
    address  = invite.get_github_email

    if address
      InviteMailer.invite_github_user(invite).deliver_now
      flash[:invite] = "Successfully sent invite!"
    else
      flash[:invite] = "The Github user you selected doesn't have an email address associated with their account."
    end
    redirect_to dashboard_path
  end


end
