
class FriendshipsController < ApplicationController

  def create
    friendship = current_user.friendships.create(friend_id: params[:friend]).valid?
    if friendship
      flash[:friendship] = "You've friended #{ current_user.friends.last.first_name}"
    else
      flash[:friendship] = "That user does not exist."
    end
    redirect_to dashboard_path
  end

  # def destroy
  #   current_user.friends.find_by_friend_id(params[:friend]).destroy
  #   redirect_to dashboard_path
  # end

end
