require "./app/models/poros/github_repo"


class GithubRepoFacade

  # This is ready to work with non-user-limited repos
  #   ? default repos
  #   ? suggested repos

  def initialize(filter)
    @filter = filter
  end

  def list_repos(qty)
    user_repos.first(qty)
  end

  def user_repos
    get_repos.map { |repo| GithubRepo.new(repo) }
  end




  private

  # def user() @filter[:user] end
  def user
    @filter[:user]
  end

  # def token() user.github_token end
  def token
    user.github_token
  end

  def get_repos
    user_repos = { token: token, target: :repos }
    GithubService.new( user_repos ).target_data
  end

end
