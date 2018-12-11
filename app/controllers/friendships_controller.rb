
class FriendshipsController < ApplicationController

  def create
    friendship = current_user.friendships.create!(friend_id: params[:friend])
    key = friendship ? :success : :fail
    flash[:notification] = add_friend[key]
    redirect_to dashboard_path
  end

  # def destroy
  #   current_user.friends.find_by_friend_id(params[:friend]).destroy
  #   redirect_to dashboard_path
  # end

  private

  def add_friend
    {
      success: "You've friended #{current_user.friends.last.first_name}.",
      fail:    "That user does not exist."
    }
  end


end
