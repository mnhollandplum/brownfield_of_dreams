require "./app/models/poros/github_repo"
require "./app/services/github_service"
class GithubUserFacade

  def initialize(token)
    @token = token
  end

  def make_repos
    @repos ||= get_repos.map do |repo|
      GithubRepo.new(repo)
    end
  end

  def get_repos
    user_repos = { target: :repos}
    user_repos[:token] = @token
    GithubService.new(user_repos).target_data
  end
end
