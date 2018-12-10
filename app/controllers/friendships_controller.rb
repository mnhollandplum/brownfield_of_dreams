
class FriendshipsController < ApplicationController

  def create
    current_user.friendships.create(friend_id: params[:friend])
    redirect_to dashboard_path
  end

  # def destroy
  #   current_user.friends.find_by_friend_id(params[:friend]).destroy
  #   redirect_to dashboard_path
  # end

end
