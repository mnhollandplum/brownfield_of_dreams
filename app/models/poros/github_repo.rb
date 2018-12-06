class GithubRepo
  def initialize(filter)
    @filter = filter
  end

  def name
    @filter[:name]
  end

  def url
    @filter[:html_url]
  end
end
