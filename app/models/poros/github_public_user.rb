
class GithubPublicUser

  def initialize(filter)
    @filter = filter
  end

  def login
    @filter[:login]
  end

  def url
    @filter[:html_url]
  end

  def is_member?
    u_id   = @filter[:id]
    member = GithubAccount.find_by_github_id(u_id)
    return !!member
  end

  def github_id
    @filter[:id]
  end




end
