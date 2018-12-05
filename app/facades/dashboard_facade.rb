class DashboardFacade
  def initialize(user)
    @user = user
  end

  def github_user
    @github_user ||= GithubUser.new(github_token)
  end

  def list_repos
    github_user.make_repos.first(5)
  end
end
