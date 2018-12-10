
class FriendsController < ApplicationController

  def create

    # WHAT ABOUT ACCEPTING FRIENDSHIP ???
    # https://dankim.io/mutual-friendship-rails/

    # https://riptutorial.com/ruby-on-rails/example/10240/self-referential-association
    # class User < ActiveRecord::Base
    #   has_many :friendships
    #   has_many :friends, :through => :friendships
    #   has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    #   has_many :inverse_friends, :through => :inverse_friendships, :source => :user
    # end



    friend = params[:friend_id] #id
    # friend = GithubAccount.find_by_github_id( params[:github_id] ).user_id
    Friendship.create(user: current_user, friend_id: friend)
    Friendship.create(user_id: friend,    friend: current_user)
  end


end
