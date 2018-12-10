
class FriendsController < ApplicationController

  def create
    friend = params[:friend_id] #id
    # friend = GithubAccount.find_by_github_id( params[:github_id] ).user_id
    Friendship.create(user: current_user, friend_id: friend)
    Friendship.create(user_id: friend,    friend: current_user)
  end


end
