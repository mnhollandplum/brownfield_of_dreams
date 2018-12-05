

class GithubRepo

  def initialize(hash)
    @hash = hash
  end

  def name
    @hash[:name]
  end

  def link
    @hash[:html_url]
  end


end
