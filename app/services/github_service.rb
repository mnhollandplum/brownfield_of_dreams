class GithubService
  def initialize(filter)
    @filter = filter
    @base_url = "https://api.github.com"
  end

  def target_data
    get_json(target)
  end

  private

  def get_json(url)
    response = user_conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def user_conn
    Faraday.new(url: "https://api.github.com") do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.headers["Authorization"] = @token
    # Faraday.new(url: @base_url) do |faraday|
    #   faraday.headers["Authorization"] = "token " + @filter[:token]
    #   faraday.adapter Faraday.default_adapter
    end
  end

  def target
   target_options[@filter[:target]]
  end

  def target_options
    {
      repos: "user/repos"
    }
  end
end
