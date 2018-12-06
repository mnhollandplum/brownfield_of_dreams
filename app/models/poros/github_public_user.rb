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
end
