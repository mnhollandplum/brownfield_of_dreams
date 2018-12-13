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
      user = GithubPublicUser.new(follower)
      user.add_email(collect_email(user.username))
      # we need to stub data for all followers/following for emails
    end
  end

  def make_following
    @followings ||= get_following.map do |following|
      user.add_email(collect_email(user.username))
    end
  end


  private

  def collect_email(username)
    get_email(username)[:email]
  end

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

  def get_email(username)
    request = {targer: :one_user, user: username }
    request[:token] = @token
    GithubService.new(request).target_data
  end




end
