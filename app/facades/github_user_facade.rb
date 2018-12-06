require "./app/models/poros/github_repo"
require "./app/models/poros/github_public_user"

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

  def make_followers
    @followers ||= get_followers.map do |follower|
      GithubPublicUser.new(follower)
    end
  end

  def make_following
    @followings ||= get_following.map do |following|
      GithubPublicUser.new(following)
    end
  end

  private

  def get_repos
    request = { target: :repos}
    request[:token] = @token
    GithubService.new(request).target_data
  end

  def get_followers
    request = { target: :followers}
    request[:token] = @token
    GithubService.new(request).target_data
  end

  def get_following
    request = { target: :following}
    request[:token] = @token
    GithubService.new(request).target_data
  end





end
