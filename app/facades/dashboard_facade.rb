require './app/facades/github_user_facade'

class DashboardFacade
  attr_reader :user
  def initialize(user)
    @user = user
  end

  def github_user
    return nil if @user.github_token == nil
    @github_user ||=  GithubUserFacade.new(@user.github_token)
  end

  def list_repos
    github_user.make_repos.first(5)
  end

  def list_followers
    github_user.make_followers
  end

  def list_following
    github_user.make_following
  end

end
